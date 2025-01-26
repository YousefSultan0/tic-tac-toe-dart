import 'shape.dart';
import 'type.dart';

// 5 * 5 2d array with the O shape
class OShape extends Shape{
  OShape(){
    typeOfShape = Type.O;
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 5; j++){
        if(((i == 0 || i == 4) && j != 0 && j != 4) || (!(i == 0 || i == 4) && (j == 0 || j == 4))) body[i][j] = '*';
      }
    }
  }
}