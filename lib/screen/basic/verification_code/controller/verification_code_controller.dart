import 'dart:async';
import 'package:Pazaryeri/product/navigator/navigator_manager.dart';
import 'package:Pazaryeri/product/navigator/navigator_route_items.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class VerificationController extends GetxController {
  RxInt counter = 180.obs; // RxInt olarak tanımla ve .obs ile izle
  late Timer _timer;

  final int codeLength = 6;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());
  }

  void startCountdown() {
    counter.value = 180;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (counter.value > 0) {
          counter.value--;
        } else {
          timer.cancel();
        }
      },
    );
  }

  void disposeTimer() {
    _timer.cancel();
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    disposeTimer();
    super.onClose();
  }

  void handleCodeInputChange(String value, int index, BuildContext context) {
    if (value.length == 1) {
      if (index < codeLength - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else {
        focusNodes[index].unfocus();
        NavigatorController.instance.pushToPage(NavigateRoutesItems.createProfile);
      }
    }
  }
  void handleCodeInputDelete(String value, int index, BuildContext context) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }
}
