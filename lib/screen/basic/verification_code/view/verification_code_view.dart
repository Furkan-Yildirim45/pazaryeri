import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/utility/page_utility/welcome_utility.dart';
import 'package:untitled/product/utility/project_utility/image_utility.dart';

import '../../create_profile/view/create_profile_view.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> with WelcomeUtility{
  int _counter = 180;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context,text: "Onayla", onPressed: () { context.route.navigateToPage(const CreateProfileView()); }),
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              width: context.sized.width,
              height: context.sized.height,
              decoration: BoxDecoration(
                  image: DecorationImage(image:
                  AssetImage(ImageUtility.getImagePath("welcome")),
                      fit: BoxFit.fitWidth
                  )
              ),
              child: Padding(
                padding: context.padding.horizontalMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    marketPlaceTitle(context),
                    context.sized.emptySizedHeightBoxHigh,
                    _verificationCodeText(context),
                    _buildVerificationCodeContainerLvb(context),
                    _timeRemainingText(context),
                    _resendButton(context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildVerificationCodeContainerLvb(BuildContext context) {
    return Container(
                    margin: context.padding.onlyTopMedium,
                    height: context.sized.dynamicWidth(0.12),
                    width: context.sized.width,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 5 ? EdgeInsets.zero : context.padding.onlyRightLow,
                          width: context.sized.dynamicWidth(0.12),
                          decoration: BoxDecoration(
                              color: ProjectColor.apricot.getColor(),
                            borderRadius: context.border.normalBorderRadius,
                            border: Border.all(width: 1,color: ProjectColor.apricot.getColor()),
                          ),
                          child: TextField(
                            style: context.general.textTheme.titleLarge?.copyWith(color: Colors.white),
                            cursorColor: Colors.white,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(border: InputBorder.none),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                    ),
                  );
  }

  Center _resendButton(BuildContext context) {
    return Center(
                      child: TextButton(
                        onPressed: () {}, child: Text('Yeni kod gönder',style:
                        context.general.textTheme.titleSmall?.copyWith(color: ProjectColor.apricot.getColor()),)
                      ),
                  );
  }

  Center _timeRemainingText(BuildContext context) {
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
                            "$_counter",
                            style: context.general.textTheme.labelLarge?.copyWith(
                              color: ProjectColor.apricot.getColor()
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }

  Text _verificationCodeText(BuildContext context) {
    return Text('Doğrulama Kodunu giriniz.',style:
                    context.general.textTheme.titleMedium,);
  }
}