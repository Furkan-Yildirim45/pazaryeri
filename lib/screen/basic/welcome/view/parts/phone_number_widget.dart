part of "../welcome_view.dart";

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({super.key});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    var dynamicComponentHeight = context.sized.dynamicHeight(0.07);
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
              height: dynamicComponentHeight,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: context.border.normalBorderRadius,
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child:
                          _buildTurkishFlag(dynamicComponentHeight, context)),
                  Expanded(
                      flex: 8,
                      child: Container(
                        height: dynamicComponentHeight,
                        width: context.sized.dynamicWidth(0.72),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: context.border.normalBorderRadius),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildSelectCountyCode(
                                dynamicComponentHeight, context),
                            _buildTextField(context),
                          ],
                        ),
                      )),
                ],
              ),)
        ],
      ),
    );
  }

  SizedBox _buildSelectCountyCode(
      double dynamicComponentHeight, BuildContext context) {
    return SizedBox(
      height: dynamicComponentHeight,
      child: TextButton(
          onPressed: () {},
          child: Text(
            '+90',
            style: context.general.textTheme.titleSmall
                ?.copyWith(color: Colors.grey),
          )),
    );
  }

  SizedBox _buildTextField(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.52),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: context.height * 0.025,
        ),
        child: TextField(
          maxLength: 11,
          maxLines: 1,
          keyboardType: TextInputType.phone,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              null,
        ),
      ),
    );
  }

  Container _buildTurkishFlag(
      double dynamicComponentHeight, BuildContext context) {
    return Container(
      height: dynamicComponentHeight,
      width: context.sized.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: context.border.normalBorderRadius,
      ),
      child: Image.asset(ImageUtility.getImagePath("turkish_flag")),
    );
  }
}


//todo: şimdi olmuş olması lazım!