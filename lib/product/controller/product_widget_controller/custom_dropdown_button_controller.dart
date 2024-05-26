
import 'package:get/get.dart';

class DropdownController<T> extends GetxController {
  Rx<T?> selectedValue = Rx<T?>(null);

  void updateSelectedValue(T? value) {
    selectedValue.value = value;
  }
}