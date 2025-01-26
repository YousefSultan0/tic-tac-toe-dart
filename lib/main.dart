import 'oShape.dart';
import 'player.dart';
import 'xShape.dart';
import 'grid.dart';
import 'gameStatus.dart';
import 'dart:io';
import 'dart:math';

void main() {
  int option = -1;
  // the home page
  while(option != 3) {
    printList();
    // initializing the main components of the game like players, board, shapes.
    Player firstPlayer = Player.namedDefault();
    Player secondPlayer = Player.namedDefault();
    XShape xShape = XShape();
    OShape oShape = OShape();
    Grid board = Grid();
    option = int.parse(stdin.readLineSync()!);
    switch (option) {
      case 1:
        {
          play(firstPlayer, secondPlayer, xShape, oShape, board);
        }
        break;
      case 2:
        {
          howToPlay(board);
        }
        break;
      case 3:
        {
          print('Exiting Program ...');
        }
        break;
      default:
        {
          print('please enter a valid option. (a number from 1 to 3 )');
        }
    }
  }


}

// this is where the game logic is
void play(Player firstPlayer, Player secondPlayer, XShape xShape, OShape oShape, Grid board){
  // getting the names of the players
  print('please enter the name of the first player: ');
  String? firstPlayerName = stdin.readLineSync();
  print('please enter the name of the second player: ');
  String? secondPlayerName = stdin.readLineSync();
  // selecting the player to start randomly,
  print('The player to start (with "X" marker) will be decided randomly');
  Random random = new Random();
  int playerToStart = random.nextInt(2) + 1;
  if(playerToStart == 1){
    firstPlayer = Player(name: firstPlayerName ?? 'first player', shape: xShape);
    secondPlayer = Player(name: secondPlayerName ?? 'second player', shape: oShape);
  }else{
    firstPlayer = Player(name: secondPlayerName ?? 'first player', shape: xShape);
    secondPlayer = Player(name: firstPlayerName ?? 'second player', shape: oShape);
  }
  // prerequisites to start the game
  firstPlayerName = firstPlayer.getName();
  print('$firstPlayerName is the Player to start');
  GameStatus gameStatus = GameStatus.INCOMPLETE;
  Player playerToPlay = firstPlayer;
  String winnerName = '';
  /* here are the actions of the game
  inorder to stop, the gameStatus should be something else rather than INCOMPLETE
  each time we get the square number, draw the shape on the board then showing the final state of the board
  we also make sure that the inputs from the user are valid inputs
   */
  while(gameStatus == GameStatus.INCOMPLETE){
    String playerName = playerToPlay.getName();
    print('$playerName\'s turn, please enter the number of the square you want to mark (from 1 to 9 ) ');
    int squareNumber = getSquareNumber(playerToPlay, board);
    board.draw(squareNumber: squareNumber, shape: playerToPlay.getShape());
    List<List<String>> playingBoard = board.getBoard();
    showBoard(playingBoard);
    gameStatus = board.getGameStatus();
    if(gameStatus == GameStatus.WINNING) winnerName = playerName;

    if(board.yourTurn(firstPlayer.getShape())) playerToPlay = firstPlayer;
    else playerToPlay = secondPlayer;
  }

  if(gameStatus == GameStatus.DRAW){
    print('Game ended in Draw.');
  }else{
    print('$winnerName is the Winner!!!');
  }
}

// a function to getTheSquare number, it make sure that it's a valid input and prints clear error messages, it only returns the square number when its valid
int getSquareNumber(Player player, Grid board){
  int squareNumber = -1;
  String enteredNumber = '';
  bool validNumber = false;
  while(!validNumber){
    enteredNumber = stdin.readLineSync()!;
    if(validInput(enteredNumber)){
      squareNumber = int.parse(enteredNumber);
      if(board.notTaken(squareNumber)) validNumber = true;
      else print('The number of Square you\'re trying to fill is already filled! please choose an empty square to fill.');
    }else{
      print('please choose an empty square to fill and enter it\'s number correctly (from 1 to 9 ).');
    }
  }
  return squareNumber;
}

// The main list of the game
void printList(){
  print('\n');
  print('************************************************');
  print('\t \t \t Welcome to Tic-Tac-Toe!');
  print('1. Start the Game.');
  print('2. How to Play.');
  print('3. Exit.');
  print('************************************************');
  print('enter the number of the option you want: ');

}

void showBoard(List<List<String>> board){
  for(int i = 0; i < 17; i++) {
    for (int j = 0; j < 17; j++) {
      stdout.write(board[i][j]);
    }
    print('');
  }
}

void howToPlay(Grid board){
  List<List<String>> infoBoard = board.getInfo();
  showBoard(infoBoard);
  print('\nInorder to play, you should start the number of the square that you want to mark.');
  print('Note that the squares are numbered from 1 to 9 from top left corner to the bottom right corner.\n');
}

bool validInput(String squareNumber) {
  if (squareNumber.length == 1 && int.tryParse(squareNumber) != null &&
      int.parse(squareNumber) >= 1 && int.parse(squareNumber) <= 9) {
    return true;
  }
  return false;
}