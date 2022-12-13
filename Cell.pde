class Cell {
  float x, y, w;
  int index;
  boolean[] walls =  {true, true, true, true};
  boolean visited;
  Cell(float x, float y, float w, int index) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.index = index;
    this.visited = false;
  }

  void show() {
    stroke(0);
    if (this.walls[0]) {
      line(this.x, this.y, this.x + this.w, this.y);
    }
    if (this.walls[1]) {
      line(this.x + this.w, this.y, this.x + this.w, this.y + this.w);
    }
    if (this.walls[2]) {
      line(this.x, this.y + this.w, this.x + this.w, this.y + this.w);
    }
    if (this.walls[3]) {
      line(this.x, this.y, this.x, this.y + this.w);
    }
  }

  void showVisit() {
    push();
    fill(255, 0, 255);
    rect(this.x+this.w/4, this.y + this.w/4, this.w/2, this.w/2);
    pop();
  }
}
