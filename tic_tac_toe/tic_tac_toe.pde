
void setup() {
  size(500, 500);         // Use actual numbers if constants not yet accessible
  initializeBoard();      // Safe — happens at runtime
  drawBoard();
  computerMove();         // Make sure this handles null-checks if needed
}

void draw() {
  background(255);
  drawBoard();
  drawMarks();
}

void keyPressed() {
  if (gameOver) {
    println("Game has ended.");
    return;
  }

  if (key >= '0' && key <= '8') {
    int num = key - '0';
    int row = num / 3;
    int col = num % 3;

    if (board[row][col] == EMPTY) {
      board[row][col] = USER;
      if (checkWin(USER)) {
        println("User (O) wins!");
        gameOver = true;
        return;
      }
      if (isBoardFull()) {
        println("No one has won.");
        gameOver = true;
        return;
      }

      computerMove();

      if (checkWin(COMPUTER)) {
        println("Computer (X) wins!");
        gameOver = true;
      } else if (isBoardFull()) {
        println("No one has won.");
        gameOver = true;
      } else {
        println("Game is still in play.");
      }

    } else {
      println("That square is already taken.");
    }
  } else {
    println("Incorrect key. Please press a number from 0 to 8.");
  }
}
  
