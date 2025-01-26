import './type.dart';

// an abstract 5 * 5 2d array for the x and o shapes to fit in it
class Shape{
  Type typeOfShape = Type.N;
  List<List<String>> body = List.generate(5, (_) => List.filled(5, ' '));

  List<List<String>> getBody(){
    return body;
  }

  Type getTypeOfShape(){
    return typeOfShape;
  }
}