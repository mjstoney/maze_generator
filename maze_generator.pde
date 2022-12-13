import java.util.*;
import java.lang.Math;

Maze m;
Player p;
int w = 20;

void setup() {
  size(800, 800);
  background(255);

  int numRows = height/w;
  int numCols = width/w;


  m = new Maze(numCols, numRows);
  p = new Player(m, 0, 0, w);
}

void draw() {

  m.show();
  p.show();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p.moveUp();
    } else if (keyCode == DOWN) {
      p.moveDown();
    } else if (keyCode == LEFT) {
      p.moveLeft();
    } else if (keyCode == RIGHT) {
      p.moveRight();
    }
  }
}
