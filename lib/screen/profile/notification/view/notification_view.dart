
import 'package:flutter/material.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/widget/general_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),isLeadingActive: true,),
    );
  }
}
