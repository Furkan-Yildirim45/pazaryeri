import 'package:get/get.dart';

import '../../product_detail/model/comment_model.dart';

class AllCommentController extends GetxController {
  RxList<CommentModel> commentItems = <CommentModel>[].obs;

    static AllCommentController? _instance;
    static void init(AllCommentController instance){
      _instance ??= instance;
    }

  static AllCommentController? get instance{
    if(_instance != null) return _instance;
    throw Exception("Instance has not initialize");
  }

  @override
  void onInit() {
    super.onInit();
    init(AllCommentController());
    final arguments = Get.arguments;
    if (arguments != null && arguments is List<CommentModel>) {
      commentItems.value = arguments;
    }
  }
}