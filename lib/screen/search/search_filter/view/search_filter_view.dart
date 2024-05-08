import 'package:flutter/material.dart';

import '../../../../product/widget/common_widget.dart';

void main() {
  runApp(AramaFiltreleme());
}

class AramaFiltreleme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: CustomAppBar(),
            bottomNavigationBar: CustomBottomNavigationBar(),
            ),
        );
    }
}