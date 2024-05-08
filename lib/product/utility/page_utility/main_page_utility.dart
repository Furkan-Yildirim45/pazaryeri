import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../screen/main_page/view/main_page_view.dart';
import '../../color/project_color.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/my_slider.dart';
import '../../widget/product_card_widget.dart';
import '../project_utility/image_utility.dart';

mixin MainPageUtility on State<MainPage> {
  List<String> arananKelimeler = [];
  TextEditingController aramaController = TextEditingController();

  void aramaYap(String kelime) {
    setState(() {
      arananKelimeler.add(kelime);
      aramaController.clear();
    });
  }

  void sil(int index) {
    setState(() {
      arananKelimeler.removeAt(index);
    });
  }

  Container popularProductGirdView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: context.border.lowBorderRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popüler Olanlar",
                style: context.general.textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Hepsini Gör",
                  style: context.general.textTheme.bodyMedium?.copyWith(color: ProjectColor.apricot.getColor()),
                ),
              ),
            ],
          ),
          Padding(
            padding: context.padding.onlyTopLow,
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
              children: List.generate(4, (index) {
                return const ProductCardWidget();
              }),
            ),
          ),
        ],
      ),
    );
  }

  Container buildInfluencerSuggestionLvb(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Influencer Önerileri",
              style: context.general.textTheme.titleMedium),
          Container(
            margin: context.padding.onlyTopLow,
            height: context.sized.dynamicHeight(0.12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 9 ? EdgeInsets.zero : context.padding.onlyRightNormal,
                  child: buildInfluencerSuggestionCard(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Stack buildInfluencerSuggestionCard(BuildContext context) {
    var dynamicSize = context.sized.dynamicWidth(0.155);
    var kZero = 0.0;
    return Stack(
      children: [
        Container(
          width: dynamicSize,
          height: dynamicSize,
          decoration: BoxDecoration(
            borderRadius: context.border.lowBorderRadius,
            border: Border.all(
              color: ProjectColor.apricot.getColor(),
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: context.border.lowBorderRadius,
            child: Image.asset(
              ImageUtility.getImagePath("6"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: kZero,
          right: kZero,
          child: const Icon(
            Icons.check_circle,
            color: Colors.blue,
          ),
        ),
        Positioned(
          bottom: kZero,
          left: kZero,
          right: kZero,
          child: Text("Ege Avcı",
              textAlign: TextAlign.center,
              style: context.general.textTheme.bodyMedium),
        )
      ],
    );
  }

  Padding buildGridViewSpecialSuggestion(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.121),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5,
              mainAxisSpacing: context.sized.normalValue,
              crossAxisSpacing: context.sized.mediumValue),
          itemBuilder: (context, index) {
            return buildSpecialSuggestionCard(context);
          },
        ),
      ),
    );
  }

  CustomElevatedButton buildSpecialSuggestionCard(BuildContext context) {
    return CustomElevatedButton(
        shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius,
            side: const BorderSide(width: 1, color: Colors.black12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: context.padding.onlyLeftLow,
              child: Image.asset(
                ImageUtility.getImagePath("4"),
                height: context.sized.mediumValue,
                width: context.sized.mediumValue,
              ),
            ),
            Padding(
              padding: context.padding.onlyLeftNormal,
              child: const Text('Sana Ozel'),
            ),
          ],
        ),
        onPressed: () {});
  }

  Padding buildBlackFridaySlider(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.2),
        child: const MySlider(),
      ),
    );
  }

  Padding buildSearchBar(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopMedium,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: context.sized.dynamicHeight(0.06),
              decoration: BoxDecoration(
                color: ProjectColor.lightGrey.getColor(),
                border: Border.all(color: Colors.black26),
                borderRadius: context.border.normalBorderRadius,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: context.padding.onlyLeftNormal,
                    child: Icon(
                      Icons.search,
                      color: ProjectColor.apricot.getColor(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: context.padding.onlyLeftNormal,
                      child: Padding(
                        padding: context.padding.onlyBottomNormal,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: aramaController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "İstediğiniz ürünü ve kategoriyi aratabilirsiniz",
                            hintStyle: context.general.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black54),
                          ),
                          onSubmitted: (kelime) {
                            aramaYap(kelime);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildBigSaleContainer(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColor.apricot.getColor(),
          borderRadius: context.border.normalBorderRadius,
        ),
        padding: context.padding.horizontalNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.padding.onlyTopNormal,
              child: Text(
                  "Büyük İndirimler",
                  style: context.general.textTheme.titleMedium?.copyWith(
                      color: Colors.white
                  )
              ),
            ),
            Container(
              margin: context.padding.onlyBottomNormal,
              height: 125,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff7d0102),
                      Color(0xff322b39),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: context.border.normalBorderRadius
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text("%50",
                              style: context.general.textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600,)
                          ),
                          Text("İNDİRİM",
                              style: context.general.textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600,)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        buildSaleProductCard(context, image: '9'),
                        buildSaleProductCard(context, image: "8"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildSaleProductCard(BuildContext context,{required String image}) {
    var dynamicSize = context.sized.dynamicWidth(0.16);
    var lowBorderRadius2 = context.border.lowBorderRadius;
    return Container(
      width: dynamicSize,
      height: dynamicSize,
      decoration: BoxDecoration(
        borderRadius: lowBorderRadius2,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: lowBorderRadius2,
        child: Image.asset(
          ImageUtility.getImagePath(image),
          width: dynamicSize,
          height: dynamicSize,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
