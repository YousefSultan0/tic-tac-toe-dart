
# Tic-Tac-Toe Console Application

## Task Description

This repository contains the source code for a simple console-based Tic-Tac-Toe game as my first application developed in Dart. The game allows two players to take turns making moves on a 3x3 grid until one player wins or the game ends in a draw.

### Features:
- 3x3 grid-based Tic-Tac-Toe board.
- Two-player mode: Player 1 is 'X', and Player 2 is 'O'.
- Interactive console prompts for each player's move.
- Input validation to ensure valid moves within the range of 1-9 and into empty cells.
- Winning and draw condition checks after each move.
- Option to restart the game after a win or draw.
- Simple and intuitive console-based interface.

## How to Run the Game

To run this Dart console-based Tic-Tac-Toe game, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/YousefSultan0/tic-tac-toe-dart.git
   cd tic-tac-toe-dart
   ```

2. **Ensure Dart SDK is installed**:
   Make sure you have Dart installed on your system. You can download and install it from the official [Dart website](https://dart.dev/get-dart).

3. **Run the game**:
   Open your terminal and navigate to the project directory, then run the following command:
   ```bash
   cd lib
   dart run main.dart
   ```

4. **Gameplay Instructions**:
   - The game will prompt Player 1 (X) and Player 2 (O) to take turns inputting their moves.
   - Enter a number between 1-9 to place your marker on the board in the corresponding cell.
   - The board will update after each move, showing the current state.
   - The game will declare a winner if either player achieves three consecutive markers in a row, column, or diagonal, or announce a draw if the board is full.
   - After the game concludes, you will be given an option to restart.

## Code Structure

- `main.dart`: Contains the game logic and handles input/output.
- The game is structured into functions for clarity and maintainability.

## Contribution

Feel free to fork this repository, make changes, and submit pull requests!
