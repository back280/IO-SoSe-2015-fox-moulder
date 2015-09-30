/**
 * Simple sketch that shows how to grap colors from a short video
 * @author: Fabian Morón Zirfas
 *
 */
// import the needed libraries
import processing.video.*;
import me.fabianmoronzirfas.colorthief.*;

P5ColorThief thief; // our thief object
Movie video;  // will hold the video
int x = 640; // this is for displaying the palette
int y = 0; // same thing here

/**
int diameter = 150;
int[] angs = {30, 10, 45, 35, 60, 38, 75, 67};
float lastAng = 0;
**/

void setup() {
  video = new Movie(this, "2015_06_02_timelapse_640x480.mov");// load the video
  thief = new P5ColorThief(this);// enter "THE THIEF"
  size(1040, 480); // 2 times the size of the video
  //video.loop(); // loop it
  video.play(); // play it
  // reduce the speed so it is better to see whats going on
  frameRate(30);

}
void draw() {
  image(video, 0, 0); // display the video
  PImage frame = video.get(); // grap the latest frame
  // extract the palette
  color [] palette = thief.getPalette(frame, 41);
  float r = red(palette[0]);
  float g = green(palette[0]);
  float b = blue(palette[0]);
  println(r,g,b);//displays RGB values in console

  // loop the palette
  // and create some rectangles from its colors
  for (int i = 0; i < palette.length; i++) {
    fill(palette[i]);
    rect(x, y, 10, 10);
    x+=10;
    // constrain it to the screen
    if (x == width) {
      y+=10;
      x=640;
      
    } // end if width
    if (y == height) {
      y = 0;
    } // end if height
  }// end loop


/**
for (int i = 0; i < angs.length; i++){
  fill(palette[i]);
  arc(75, 75, diameter, diameter, lastAng, lastAng+radians(angs[i]));
  lastAng += radians(angs[i]);  
}
**/


} // end draw
// needed to grap the video
void movieEvent(Movie m) {
  m.read();
}

