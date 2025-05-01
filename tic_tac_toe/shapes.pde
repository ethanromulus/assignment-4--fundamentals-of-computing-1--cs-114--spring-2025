void drawBoard() {
  stroke(0);
  strokeWeight(3);
  for (int i = 1; i < GRID_SIZE; i++) {
    line(i * CELL_SIZE, 0, i * CELL_SIZE, CANVAS_SIZE);
    line(0, i * CELL_SIZE, CANVAS_SIZE, i * CELL_SIZE);
  }
}

void drawMarks() {
  for (int i = 0; i < GRID_SIZE; i++) {
    for (int j = 0; j < GRID_SIZE; j++) {
      float centerX = j * CELL_SIZE + CELL_SIZE / 2;
      float centerY = i * CELL_SIZE + CELL_SIZE / 2;
      float offset = CELL_SIZE / 4;

      if (board[i][j] == USER) {
        noFill();
        stroke(0);
        strokeWeight(3);
        ellipse(centerX, centerY, CELL_SIZE * 0.6, CELL_SIZE * 0.6);
      } else if (board[i][j] == COMPUTER) {
        stroke(0);
        strokeWeight(3);
        line(centerX - offset, centerY - offset, centerX + offset, centerY + offset);
        line(centerX + offset, centerY - offset, centerX - offset, centerY + offset);
      }
    }
  }
}
void computerMove() {
  // Simple random move AI
  ArrayList<int[]> emptyCells = new ArrayList<int[]>();
  
  for (int i = 0; i < GRID_SIZE; i++) {
    for (int j = 0; j < GRID_SIZE; j++) {
      if (board[i][j] == EMPTY) {
        emptyCells.add(new int[]{i, j});
      }
    }
  }
  
  if (emptyCells.size() > 0) {
    int[] move = emptyCells.get((int)random(emptyCells.size()));
    board[move[0]][move[1]] = COMPUTER;
  }
}

boolean isBoardFull() {
  for (int i = 0; i < GRID_SIZE; i++) {
    for (int j = 0; j < GRID_SIZE; j++) {
      if (board[i][j] == EMPTY) {
        return false;
      }
    }
  }
  return true;
}

boolean checkWin(int player) {
  // Check rows
  for (int i = 0; i < GRID_SIZE; i++) {
    if (board[i][0] == player && board[i][1] == player && board[i][2] == player) {
      return true;
    }
  }
  // Check columns
  for (int j = 0; j < GRID_SIZE; j++) {
    if (board[0][j] == player && board[1][j] == player && board[2][j] == player) {
      return true;
    }
  }
  // Check diagonals
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
    return true;
  }
  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
    return true;
  }
  return false;
}
