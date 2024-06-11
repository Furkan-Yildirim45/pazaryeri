import 'package:get/get.dart';

class PhoneNumberController extends GetxController{
  var input = ''.obs;

  void setInput(String value) {
    input.value = value;
  }
}