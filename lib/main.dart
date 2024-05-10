import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/product/navigator/navigator_manager.dart';
import 'package:untitled/product/navigator/navigator_route_items.dart';
import 'package:untitled/product/theme/project_theme.dart';
import 'package:untitled/screen/unknown_page/view/unknown_view.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  final navigatorController = NavigatorController.instance;
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ProjectTheme(context).theme,
      initialRoute: NavigatorRoutes.init,
      debugShowCheckedModeBanner: false,
      getPages: NavigatorRoutes().routes,
      unknownRoute: GetPage(
        name: NavigateRoutesItems.unknown.withSlash,
        page: () => const UnknownView(),
      ),
    );
  }
}


//todo:knk generalAppBara bak yüksekliğinde bir sıkıntı var gibi!

//todo:bildirimler,ödeme_sayfası,arama_filtrele sayfaları aynı
//todo:commonu siliceksin.

//todo: ana sayfada bug var ıncorrect parent size widget!