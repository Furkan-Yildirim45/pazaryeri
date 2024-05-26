import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../screen/basic/verification_code/controller/verification_code_controller.dart';
import '../../../color/project_color.dart';

mixin VerificationCodeUtility{
  final VerificationController controller = Get.put(VerificationController());

  Container buildVerificationCodeContainerLvb(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopMedium,
      height: context.sized.dynamicWidth(0.12),
      width: context.sized.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: index == controller.codeLength - 1
                ? EdgeInsets.zero
                : context.padding.onlyRightLow,
            width: context.sized.dynamicWidth(0.12),
            decoration: BoxDecoration(
              color: ProjectColor.apricot.getColor(),
              borderRadius: context.border.normalBorderRadius,
              border: Border.all(width: 1,color: ProjectColor.apricot.getColor()),
            ),
            child: Focus(
              onKeyEvent: (node, event) {
                if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace && controller.controllers[index].text.isEmpty) {
                  controller.handleCodeInputDelete(controller.controllers[index].text, index, context);
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: TextField(
                controller: controller.controllers[index],
                focusNode: controller.focusNodes[index],
                style: context.general.textTheme.titleLarge?.copyWith(color: Colors.white),
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(border: InputBorder.none,counterText: '',),
                keyboardType: TextInputType.phone,
                maxLength: 1,
                onChanged: (value) {
                  controller.handleCodeInputChange(value, index, context,);
                },
              ),
            ),
          );
        },
        itemCount: controller.codeLength,
      ),
    );
  }

  Center resendButton(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            controller.startCountdown();
          }, child: Text('Yeni kod gönder',style:
      context.general.textTheme.titleSmall?.copyWith(color: ProjectColor.apricot.getColor()),)
      ),
    );
  }

  Text verificationCodeText(BuildContext context) {
    return Text('Doğrulama Kodunu giriniz.',style:
    context.general.textTheme.titleMedium,);
  }

  Center timeRemainingText(BuildContext context,) {
    return Center(
      child: Padding(
        padding: context.padding.onlyTopNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Doğrulama kodunuzun kalan süresi: ',
              style: context.general.textTheme.labelLarge,
            ),
            Text(
              "${controller.counter.value}",
              style: context.general.textTheme.labelLarge?.copyWith(
                  color: ProjectColor.apricot.getColor()
              ),
            ),
          ],
        ),
      ),
    );
  }
}