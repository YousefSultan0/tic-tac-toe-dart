import 'dart:io';
import 'type.dart';
import 'shape.dart';
import 'point.dart';
import 'gameStatus.dart';

class Grid{
  static int rows = 17, columns = 17;
  List<List<String>> board = List.generate(rows, (_) => List.filled(columns, ' '));
  List<List<String>> infoBoard = List.generate(rows, (_) => List.filled(columns, ' '));
  var boardValue = new Map();
  Type lastMove = Type.N;

  Grid(){
    reload();
  }

  // initializing the basic board game
  void reload(){
    for(int i = 0; i < 17; i++){
      int cnt = 0;
      for(int j = 0; j < 17; j++){
        if(i == 5 || i == 11){
          board[i][j] = '-';
          continue;
        }
        ++cnt;
        if(cnt > 5) {
          board[i][j] = '|';
          cnt = 0;
        }
        else{
          board[i][j] = ' ';
        }
      }
    }
  }


  List<List<String>> getBoard(){
    return board;
  }

  // we take the square number and the shape to draw then we draw it
  void draw({required int squareNumber, required Shape shape}){
    List<List<String>> marker = shape.getBody();
    Type typeofShape = shape.getTypeOfShape();
    Point coordinates = findCoordinates(squareNumber);
    boardValue[squareNumber] = shape.getTypeOfShape();
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 5; j++)
        board[i+coordinates.x][j+coordinates.y] = marker[i][j];
    }
    lastMove = shape.getTypeOfShape();
  }

  // finding the coordinates of the square in the board
  Point findCoordinates(int squareNumber){
    int x;
    if(squareNumber < 4) x = 0;
    else if(squareNumber < 7) x = 6;
    else x = 12;
    int y;
    squareNumber %= 3;
    if(squareNumber == 0) y = 12;
    else if(squareNumber == 2) y = 6;
    else y = 0;
    return(Point(x, y));
  }

  // checks if the somebody wins or not, if an empty square doesn't exist it return draw else incomplete
  GameStatus getGameStatus(){
    if(boardValue[1] == boardValue[2] && boardValue[1] == boardValue[3] && boardValue[1] != null
      || (boardValue[1] == boardValue[4] && boardValue[1] == boardValue[7] && boardValue[1] != null)
      || (boardValue[1] == boardValue[5] && boardValue[1] == boardValue[9] && boardValue[1] != null)
      || (boardValue[2] == boardValue[5] && boardValue[2] == boardValue[8] && boardValue[2] != null)
      || (boardValue[3] == boardValue[6] && boardValue[3] == boardValue[9] && boardValue[3] != null)
      || (boardValue[3] == boardValue[5] && boardValue[3] == boardValue[7] && boardValue[3] != null)
      || (boardValue[4] == boardValue[5] && boardValue[4] == boardValue[6] && boardValue[4] != null)
      || (boardValue[7] == boardValue[8] && boardValue[7] == boardValue[9] && boardValue[7] != null))
      return GameStatus.WINNING;
    for(int square = 1; square <= 9; square++){
      if(boardValue[square] == null) return GameStatus.INCOMPLETE;
    }
    return GameStatus.DRAW;
  }

  // simple check if the square we are trying to mark is empty
  bool notTaken(int squareNumber){
   return (boardValue[squareNumber] == null);
  }

  // checks if the player who's trying to draw has the turn or it's not his turn
  bool yourTurn(Shape shape){
    return (shape.getTypeOfShape() != lastMove);
  }

  // return the board with a big number on each square to make it easy for the players to play
  List<List<String>> getInfo(){
    typeOne();
    typeTwo();
    typeThree();
    typeFour();
    typeFive();
    typeSix();
    typeSeven();
    typeEight();
    typeNine();
    return infoBoard;
  }

  void typeOne(){
    infoBoard[1][1] = '1';
    infoBoard[4][1] = '1';
    infoBoard[4][3] = '1';
    for(int j = 0; j < 5; j++) infoBoard[j][2] = '1';
  }

  void typeTwo(){
    Point coordinates = findCoordinates(2);
    for(int j = 0; j < 5; j++){
      infoBoard[2+coordinates.x][j+coordinates.y] = '2';
      infoBoard[0+coordinates.x][j+coordinates.y] = '2';
      infoBoard[4+coordinates.x][j+coordinates.y] = '2';
    }
    infoBoard[1+coordinates.x][4+coordinates.y] = '2';
    infoBoard[3+coordinates.x][0+coordinates.y] = '2';
  }

  void typeThree(){
    Point coordinates = findCoordinates(3);
    for(int j = 0; j < 5; j++){
      infoBoard[0+coordinates.x][j+coordinates.y] = '3';
      infoBoard[2+coordinates.x][j+coordinates.y] = '3';
      infoBoard[4+coordinates.x][j+coordinates.y] = '3';
      infoBoard[j+coordinates.x][4+coordinates.y] = '3';
    }
  }

  void typeFour(){
    Point coordinates = findCoordinates(4);
    for(int j = 0; j < 5; j++){
      infoBoard[2+coordinates.x][j+coordinates.y] = '4';
      infoBoard[j+coordinates.x][3+coordinates.y] = '4';
    }
    infoBoard[0+coordinates.x][0+coordinates.y] = '4';
    infoBoard[1+coordinates.x][0+coordinates.y] = '4';
  }

  void typeFive(){
    Point coordinates = findCoordinates(5);
    for(int j = 0; j < 5; j++){
      infoBoard[0+coordinates.x][j+coordinates.y] = '5';
      infoBoard[2+coordinates.x][j+coordinates.y] = '5';
      infoBoard[4+coordinates.x][j+coordinates.y] = '5';
    }
    infoBoard[1+coordinates.x][0+coordinates.y] = '5';
    infoBoard[3+coordinates.x][4+coordinates.y] = '5';
  }

  void typeSix(){
    Point coordinates = findCoordinates(6);
    for(int j = 0; j < 5; j++){
      infoBoard[0+coordinates.x][j+coordinates.y] = '6';
      infoBoard[2+coordinates.x][j+coordinates.y] = '6';
      infoBoard[4+coordinates.x][j+coordinates.y] = '6';
      infoBoard[j+coordinates.x][0+coordinates.y] = '6';
    }
    infoBoard[3+coordinates.x][4+coordinates.y] = '6';
  }

  void typeSeven(){
    Point coordinates = findCoordinates(7);
    for(int j = 0; j < 5; j++){
      infoBoard[0+coordinates.x][j+coordinates.y] = '7';
    }
    infoBoard[1+coordinates.x][3+coordinates.y] = '7';
    infoBoard[2+coordinates.x][2+coordinates.y] = '7';
    infoBoard[3+coordinates.x][2+coordinates.y] = '7';
    infoBoard[4+coordinates.x][2+coordinates.y] = '7';
  }

  void typeEight(){
    Point coordinates = findCoordinates(8);
    for(int j = 0; j < 5; j++){
      infoBoard[0+coordinates.x][j+coordinates.y] = '8';
      infoBoard[2+coordinates.x][j+coordinates.y] = '8';
      infoBoard[4+coordinates.x][j+coordinates.y] = '8';
      infoBoard[j+coordinates.x][0+coordinates.y] = '8';
      infoBoard[j+coordinates.x][4+coordinates.y] = '8';
    }
  }

  void typeNine(){
    Point coordinates = findCoordinates(9);
    for(int j = 0; j < 5; j++){
      infoBoard[0+coordinates.x][j+coordinates.y] = '9';
      infoBoard[2+coordinates.x][j+coordinates.y] = '9';
      infoBoard[4+coordinates.x][j+coordinates.y] = '9';
      infoBoard[j+coordinates.x][0+coordinates.y] = '9';
      infoBoard[j+coordinates.x][4+coordinates.y] = '9';
    }
    infoBoard[3+coordinates.x][0+coordinates.y] = ' ';
  }



}