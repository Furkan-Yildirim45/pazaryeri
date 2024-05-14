import 'package:get/get.dart';

import '../../widget/custom_alert_dialog.dart';

class AlertController extends GetxController {
  void showAlert() {
    Get.dialog(
      const CustomAlertDialog(
        title: "Ürün Sepete Eklendi",
        message: "Siparişinize devam etmek için Sepete gidebilirisiniz ve alışverişinize kaldığınız yerden devam edebilirsiniz.",
        image: "added_to_card",
      ),
    );
  }
}