import 'package:flutter/material.dart';
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
    if (selectedDay.value != null && selectedDay.value! > daysInMonth.length) {
      selectedDay.value = 1;
    }
  }
  void updateSelectedYear(int? value) => selectedYear.value = value;

  void updateDaysInMonth(int? month) {
    if (month != null && selectedYear.value != null) {
      int days = DateTime(selectedYear.value!, month + 1, 0).day;
      daysInMonth = List.generate(days, (index) => index + 1);
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
      return 'Hobilerinizi giriniz';
    }
    return null;
  }

  String? nameValidator(value) {
    if (value?.isEmpty ?? false) {
      return 'Adınızı giriniz';
    }
    return null;
  }

  String? lastNameValidator(value) {
    if (value?.isEmpty ?? false) {
      return 'Soyadınızı giriniz';
    }
    return null;
  }

  void floatActionOnPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      NavigatorController.instance.pushToPage(NavigateRoutesItems.mainPage);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun!')),
      );
    }
  }
}
