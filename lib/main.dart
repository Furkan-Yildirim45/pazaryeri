import 'package:flutter/material.dart';
import 'package:untitled/product/theme/project_theme.dart';
import 'package:untitled/screen/basic/welcome/view/welcome_view.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomeView(),
      theme: ProjectTheme().theme,
    );
  }
}
