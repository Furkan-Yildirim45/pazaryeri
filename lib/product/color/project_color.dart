
import 'dart:ui';

enum ProjectColor{
  apricot,starYellow,lightGrey
}

extension ProjectColorExtension on ProjectColor{
  Color getColor(){
    switch(this){
      case ProjectColor.apricot:
        return const Color(0xffEBA55D);
      case ProjectColor.starYellow:
        return const Color(0xffedbd1d);
      case ProjectColor.lightGrey:
        return const Color(0xfff8f8f8);
    }
  }
}