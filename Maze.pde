class Maze {
  Cell cells[];
  int numRows, numCols;
  Maze(int numCols, int numRows) {
    this.numCols = numCols;
    this.numRows = numRows;

    this.cells = new Cell[numCols*numRows];
    this.initMaze();
    this.generateMaze();
    this.show();
  }

  void initMaze() {
    for (int i = 0; i < cells.length; i++) {
      int row = i / this.numCols;
      int col = i % this.numCols;
      cells[i] = new Cell(col*w, row*w, w, i);
    }
  }

  void show() {
    rect(0, 0, width, height);
    for (int i = 0; i < this.cells.length; i++) {
      this.cells[i].show();
    }
  }

  void removeWalls(int a, int b) {
    //print("a, b: " + a + " " + b + "\t");
    // a > b -> remove a.left and b.right
    if (a - b == 1) {
      //println("remove a.left, b.right");
      this.cells[a].walls[3] = false;
      this.cells[b].walls[1] = false;
    } else if (a - b == -1)
    {
      //println("remove a.right, b.left");
      this.cells[a].walls[1] = false;
      this.cells[b].walls[3] = false;
    } else if (a - b == height/this.cells[a].w) {
      //println("remove a.top, b.bot");
      this.cells[a].walls[0] = false;
      this.cells[b].walls[2] = false;
    } else if (a - b == -height/this.cells[a].w) {
      //println("remove a.bot, b.top");
      this.cells[a].walls[2] = false;
      this.cells[b].walls[0] = false;
    }
  }


  void generateMaze() {
    println("Generating maze!");
    Deque<Cell> stack = new ArrayDeque<Cell>(this.numCols*this.numRows);
    ArrayList<Integer> neighbors = new ArrayList<Integer>();

    Cell curr = this.cells[5];
    stack.add(curr);
    this.cells[5].visited = true;
    while (!stack.isEmpty()) {

      curr = stack.pop();
      neighbors.clear();
      curr.showVisit();
      if (curr.x > 0 && !this.cells[curr.index - 1].visited) {
        neighbors.add(curr.index - 1);
      }
      if (curr.x < width - curr.w && !this.cells[curr.index + 1].visited) {
        neighbors.add(curr.index + 1);
      }
      if (curr.y > 0 && !this.cells[curr.index - this.numCols].visited) {
        neighbors.add(curr.index - this.numCols);
      }
      if (curr.y < height - curr.w && !this.cells[curr.index + this.numCols].visited) {
        neighbors.add(curr.index + this.numCols);
      }
      stack.push(curr);
      Cell next = curr;
      if (neighbors.size() > 0) {

        int n = (int)(Math.random() * neighbors.size());
        next = this.cells[neighbors.get(n)];
        next.visited = true;
        stack.push(next);
        removeWalls(curr.index, next.index);
      } else {
        stack.pop();
      }
    }
  }
}
