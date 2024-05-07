
import 'package:flutter/material.dart';

import '../../screen/product/product_detail/model/comment_model.dart';
import '../../screen/profile/profile_page/model/profile_lvb_item_model.dart';

class ProjectInit {
  List<CommentModel> generateDummyComments() {
    return List.generate(10, (index) {
      return CommentModel(
        commentDate: '10-05-2024 08.37',
        commentID: index + 1,
        customerID: index % 3 + 1,
        comment: "Ürün kalitesi gerçekten harika, çok memnun kaldım. Ancak teslimat biraz uzun sürdü, daha hızlı olabilirdi. Genel olarak, üründen çok memnunum, tavsiye ederim.",
        starPoint: (index % 5) + 1,
      );
    });
  }

  List<ProfileLvbItemModel> dummyData = [
    ProfileLvbItemModel(icon: Icons.wallet_outlined, text: "Cüzdanım"),
    ProfileLvbItemModel(icon: Icons.assignment_outlined, text: "Geçmiş Siparişlerim"),
    ProfileLvbItemModel(icon: Icons.location_on_outlined, text: "Adresslerim"),
    ProfileLvbItemModel(icon: Icons.credit_card_outlined, text: "Kartlarım"),
    ProfileLvbItemModel(icon: Icons.settings_outlined, text: "Hesap Ayarları"),
    ProfileLvbItemModel(icon: Icons.exit_to_app_outlined, text: "Çıkış Yap"),
  ];
}
