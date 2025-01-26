import 'shape.dart';

// each player has a name and a shape to draw on the board
class Player {
  String name;
  Shape shape;

  Player.namedDefault() : name = '', shape = Shape();

  Player({required this.name, required this.shape});

  String getName(){
    return name;
  }

  Shape getShape(){
    return shape;
  }
}