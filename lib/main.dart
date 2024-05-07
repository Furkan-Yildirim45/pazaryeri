import 'package:flutter/material.dart';
import 'package:untitled/product/theme/project_theme.dart';
import 'package:untitled/screen/basic/welcome/view/welcome_view.dart';
import 'package:untitled/screen/profile/profile_page/view/profile_View.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfileView(),
      theme: ProjectTheme(context).theme,
    );
  }
}


//todo: projede öğrenilmesi gerekenler : MVC,GetX
