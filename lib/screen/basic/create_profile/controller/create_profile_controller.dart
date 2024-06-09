import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/navigator/navigator_route_items.dart';

class CreateProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get getFormKey => _formKey;

  String name = "";
  String lastname = "";
  String hobbies = "";

  RxnInt selectedDay = RxnInt(null);
  RxnInt selectedMonth = RxnInt(null);
  RxnInt selectedYear = RxnInt(null);
  List<int> daysInMonth = [];

  void updateSelectedDay(int? value) => selectedDay.value = value;
  void updateSelectedMonth(int? value) {
    selectedMonth.value = value;
    updateDaysInMonth(value);
  }
  void updateSelectedYear(int? value) {
    selectedYear.value = value;
    updateDaysInMonth(selectedMonth.value);
  }

  void updateDaysInMonth(int? month) {
    if (month != null && selectedYear.value != null) {
      int days = DateTime(selectedYear.value!, month + 1, 0).day;
      daysInMonth = List.generate(days, (index) => index + 1);
      if (selectedDay.value != null && selectedDay.value! > days) {
        selectedDay.value = days;
      }
    } else {
      daysInMonth = [];
    }
  }

  void updateName(String? value) {
    if (value?.isNotEmpty ?? false) name = value!;
  }

  void updateLastname(String? value) {
    if (value?.isNotEmpty ?? false) lastname = value!;
  }

  void updateHobbies(String? value) {
    if (value?.isNotEmpty ?? false) hobbies = value!;
  }

  String? emailValidator(value) {
    if (value?.isEmpty ?? false) {
      return "";
    }
    return null;
  }

  String? nameValidator(value) {
    if (value?.isEmpty ?? false) {
      return "";
    }
    return null;
  }

  String? lastNameValidator(value) {
    if (value?.isEmpty ?? false) {
      return "";
    }
    return null;
  }

  void floatActionOnPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      NavigatorController.instance.pushToPage(NavigateRoutesItems.mainPage);
    } else {
      if (nameController.text.isEmpty ||
          lastnameController.text.isEmpty ||
          emailController.text.isEmpty) {
        Get.showSnackbar(
                    GetSnackBar(
                messageText: AwesomeSnackbarContent(
                  title: 'Hata',
                  message: 'Lütfen alanları boş bırakmayınız!',
                  contentType: ContentType.failure,
                ),
                backgroundColor: Colors.transparent,
                borderRadius: 10,
                duration: const Duration(seconds: 2),
                snackPosition: SnackPosition.BOTTOM,
              ),);
      }
    }
  }
}
