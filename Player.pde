class Player {
  float x, y, speed;
  Maze m;
  Player(Maze m, float x, float y, float speed) {
    this.m = m;
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  void show() {
    push();
    noStroke();
    fill(255, 0, 0);
    rect(this.x + w/4, this.y + w/4, w/2, w/2);
    pop();
  }

  int getPlayerCellIndex() {
    int row = floor(this.y/w % m.numCols);
    int col = floor(this.x/w % m.numCols);
    return row * m.numCols + col;
  }

  boolean isCollision(int dir) {
    int playerIndex = getPlayerCellIndex();
    println(this.x/w%m.numCols + "\t" + this.y/w%m.numRows + "\t" + playerIndex);
    if (m.cells[playerIndex].walls[dir] == false) {
      return false;
    } else {
      return true;
    }
  }

  void moveUp() {
    if (!isCollision(0)) {
      this.y -= this.speed;
    }
  }
  void moveDown() {
    if (!isCollision(2)) {
      this.y += this.speed;
    }
  }

  void moveLeft() {
if (!isCollision(3)) {
      this.x -= this.speed;
    }
  }

  void moveRight() {
if (!isCollision(1)) {
      this.x += this.speed;
    }
  }
}
