import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/utility/welcome_utility.dart';

import '../../verification_code/view/verification_code_view.dart';

class WelcomeView extends StatelessWidget with WelcomeUtility{
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context,text: 'Kodu Gönder',onPressed: () {
        context.route.navigateToPage(const VerificationScreen());
      },),
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              width: context.sized.width,
              height: context.sized.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(image:
                  AssetImage("assets/images/welcome.png"),
                      fit: BoxFit.fitWidth
                  )
              ),
              child: Padding(
                padding: context.padding.horizontalMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    marketPlaceTitle(context),
                    welcomeAboardText(context),
                    enterYourNumberText(context),
                    const PhoneNumberWidget(),
                    informationText(context),
                    const PrivacyPolicyWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({super.key});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: context.sized.dynamicWidth(0.12),
            width: context.sized.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: context.border.normalBorderRadius,
            ),
          ),
          Container(
            height: context.sized.dynamicWidth(0.12),
            width: context.sized.dynamicWidth(0.72),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: context.border.normalBorderRadius
            ),
            child: Row(
              children: [
                TextButton(onPressed: (){}, child:
                Text('+90',style: context.general.textTheme.titleSmall?.copyWith(color: Colors.grey),)),
                SizedBox(
                  width: context.sized.dynamicWidth(0.52),
                  child: Padding(
                    padding: context.padding.onlyBottomNormal,
                    child: const TextField(
                      cursorColor: Colors.black,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: context.sized.dynamicWidth(0.16),
              height: context.sized.dynamicWidth(0.12),
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/turkish_flag.png"))
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  _PrivacyPolicyWidgetState createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape: RoundedRectangleBorder(
        borderRadius: context.border.normalBorderRadius
      ),
      contentPadding: EdgeInsets.zero,
      title: GestureDetector(
        onTap: () {},
        child: Text(
          "Gizlilik Politikası ve şartlarinizi kabul ediyorum.",
          style: context.general.textTheme.bodySmall?.copyWith(
            color: ProjectColor.apricot.getColor()
          ),
        ),
      ),
      value: _isChecked,
      activeColor: ProjectColor.apricot.getColor(),
      onChanged: (value) {
        setState(() {
          _isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

