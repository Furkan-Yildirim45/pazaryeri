
import 'package:get/get.dart';

class GlobalController extends GetxController{
  var isLoading = false.obs;

  void changeLoading(){
    isLoading.value = !isLoading.value;
  }
}