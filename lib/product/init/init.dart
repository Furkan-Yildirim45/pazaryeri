
import '../../screen/product/product_detail/model/comment_model.dart';

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
}
