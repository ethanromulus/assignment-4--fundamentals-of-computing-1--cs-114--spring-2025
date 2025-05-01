int[][] board;             // ✅ Declare without size
boolean gameOver = false;  // ✅ Game state

void initializeBoard() {
  // Wait to use GRID_SIZE until this function is called from setup()
  board = new int[3][3];  // ❗ Use literal 3 instead of GRID_SIZE to avoid reference-before-defined
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = 0;    // Use 0 directly instead of EMPTY if EMPTY is also undefined yet
    }
  }
}
