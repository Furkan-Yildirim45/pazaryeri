
import 'package:flutter/material.dart';
import 'package:untitled/product/color/project_color.dart';

class ProjectTheme{
  late ThemeData theme;

  ProjectTheme(){
    theme = ThemeData(
      textTheme: TextTheme(
        displayMedium: TextStyle(
          color: ProjectColor.apricot.getColor(),
        )
      )
    );
  }
}