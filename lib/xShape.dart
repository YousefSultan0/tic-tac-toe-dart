import 'shape.dart';
import 'type.dart';

// 5 * 5 2d array with the O shape
class XShape extends Shape{
  XShape(){
    typeOfShape = Type.X;
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 5; j++){
        if(i == j || (i == 0 && j == 4) || (j == 0 && i == 4) || (i == 1 && j == 3) || (i == 3 && j == 1)) body[i][j] = '*';
      }
    }
  }
}