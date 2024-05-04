
import 'dart:ui';

enum ProjectColor{
  apricot,
}

extension ProjectColorExtension on ProjectColor{
  Color getColor(){
    switch(this){
      case ProjectColor.apricot:
        return const Color(0xffEBA55D);
    }
  }
}