import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/extension/context/border_Radius.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: context.sized.dynamicHeight(2), //componentlerin total heightleri burda olmalı
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  //resim component
                  Container(
                    width: context.sized.width,
                    height: context.sized.dynamicHeight(0.6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("assets/images/product.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: context.padding.onlyTopHigh,
                      child: Padding(
                        padding: context.padding.horizontalMedium,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomElevatedButton(
                                width: context.sized.dynamicWidth(0.1),
                                height: context.sized.dynamicWidth(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: context.border.lowBorderRadius),
                                child: const Icon(Icons.arrow_back_outlined),
                                onPressed: () {}),
                            CustomElevatedButton(
                                width: context.sized.dynamicWidth(0.1),
                                height: context.sized.dynamicWidth(0.1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: context.myBorder
                                        .dynamicBorderRadiusCircular(
                                        borderSize: 0.03)),
                                child: const Icon(Icons.favorite),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //ürün bilgisi component
                  Positioned(
                    top: context.sized.dynamicHeight(0.6) - 35,
                    child: Container(
                      padding: context.padding.horizontalMedium,
                      width: context.sized.width,
                      height: context.sized.dynamicHeight(0.8),
                      decoration: BoxDecoration(
                        borderRadius: context.border.highBorderRadius,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: context.padding.onlyTopMedium,
                        child: SizedBox(
                          height: context.sized.dynamicHeight(0.35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //iç kısmı
                              _productShopName(context),
                              _productNameAndCode(context, textStyle: context.general.textTheme.titleMedium?.copyWith(color: Colors.grey) ?? const TextStyle()),
                              _productRating(context, starSize: context.sized.dynamicHeight(0.02)),
                              //ürün bilgisi content
                              Padding(
                                padding: context.padding.onlyTopNormal,
                                child: const Text('Yüzünüze parlaklık ve nem verir. Sivilce akne oluşumunu önler. Üstelik içindeki C vitamini sayesinde vücudunuzun cilt bariyerini güçlendirir.'),
                              ),
                              //divider
                              _pageDivider(context),
                              //adet bilgisi girme
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ADET',style: context.general.textTheme.titleLarge,),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      //backgroundContainer
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: context.border.lowBorderRadius,
                                        ),
                                        width: context.sized.dynamicHeight(0.06) * 4,
                                        height: context.sized.dynamicHeight(0.06),
                                        child: Center(child: Text('1',style:
                                        context.general.textTheme.titleLarge,)),
                                      ),
                                      _quantityButton(context,text: "-",isLeft: true),
                                      _quantityButton(context, text: "+",isLeft: false)
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //tutar ve sepete ekleme kısmı
                  Positioned(
                    left: 0,
                    right: 0,
                    top: context.sized.dynamicHeight(0.905),
                    child: Container(
                      padding: context.padding.horizontalMedium,
                      width: double.infinity,
                      height: context.sized.dynamicHeight(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: context.myBorder.dynamicBorderRadiusOnly(topRight: 0.08, topLeft: 0.08),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //tutar ve sepete ekle
                          Padding(
                            padding: context.padding.onlyTopNormal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('368,00 TL',style:
                                      context.general.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),),
                                    Text('Toplam Tutar',style:
                                      context.general.textTheme.titleSmall?.copyWith(color: Colors.grey),)
                                  ],
                                ),
                                CustomElevatedButton(
                                  width: context.sized.dynamicWidth(0.45),
                                    height: context.sized.dynamicHeight(0.07),
                                    onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: context.myBorder.dynamicBorderRadiusCircular(borderSize: 0.04)
                                  ),
                                  backgroundColor: ProjectColor.apricot.getColor(),
                                    child: Text('Sepete ekle',style: context.general.textTheme.titleLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.w500),),
                                ),
                              ],
                            ),
                          ),
                          _pageDivider(context),
                          Container(
                            margin: context.padding.onlyTopNormal,
                            height: context.sized.dynamicHeight(0.11),
                            width: context.sized.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //satıcı profile kutusu
                                _sellerProfileContainer(context),
                                //Satıcı bilgisi ve ürün rating
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Emre Armağan / Satıcı',style:
                                      context.general.textTheme.titleMedium,),
                                    _productRating(context, starSize: context.sized.dynamicHeight(0.02)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: context.padding.onlyTopNormal,
                            child: Text('Ürün Değerlendirmeleri',style: context.general.textTheme.titleMedium,),
                          ),
                          //ürün değerlendirme kutucuğu
                          Container(
                            padding: context.padding.horizontalNormal,
                            margin: context.padding.onlyTopNormal,
                            width: context.sized.width,
                            height: 400,
                            decoration: BoxDecoration(
                              color: ProjectColor.lightGrey.getColor(),
                              borderRadius: context.border.highBorderRadius
                            ),

                            child: Column(
                              children: [
                                //Satıcı ve ürün ön bilgisi değerlendirmeler için
                                Padding(
                                  padding: context.padding.onlyTopNormal,
                                  child: Row(
                                    children: [
                                      _sellerProfileContainer(context,url: "assets/images/product.png"),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _productShopName(context),
                                          _productNameAndCode(context, textStyle: context.general.textTheme.titleSmall?.copyWith(color: Colors.grey) ?? const TextStyle()),
                                          _productRating(context, starSize: context.sized.dynamicHeight(0.015),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                _pageDivider(context),
                                //todo: dummy olusturucaksın commentModele!
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _sellerProfileContainer(
    BuildContext context, {
    String? url,
  }) {
    return Container(
      margin: context.padding.onlyRightNormal,
      height: context.sized.dynamicHeight(0.11),
      width: context.sized.dynamicHeight(0.11),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: context.border.normalBorderRadius,
        image: url != null ? DecorationImage(image: AssetImage(url)) : null,
      ),
    );
  }

  Text _productNameAndCode(BuildContext context,{required TextStyle textStyle}) => Text('Yüz Bakım Serumu PZ5354686', style: textStyle,);

  Text _productShopName(BuildContext context) => Text('M.Lawrence Serum', style: context.general.textTheme.titleLarge,);

  Row _productRating(BuildContext context,{required double starSize}) {
    return Row(
      children: [
        //total star average
        Container(
          margin: context.padding.onlyRightLow,
          padding: context.padding.horizontalLow,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: context.border.lowBorderRadius,
          ),
          child: Text(
            '4.3',
            style: context.general.textTheme.titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        //star point
        SizedBox(
          width: starSize * 5,
          height: starSize,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                size: starSize,
                color: index == 4
                    ? Colors.grey
                    : ProjectColor.starYellow.getColor(),
              );
            },
          ),
        ),
        //divider
        Container(
          margin: context.padding.horizontalLow,
          width: 2,
          height: starSize * 1.5,
          color: Colors.black54,
        ),
        //değerlendirme
        Text(
          '1234 Değerlendirme',
          style: context.general.textTheme.labelSmall
              ?.copyWith(color: Colors.grey,fontSize: context.sized.dynamicWidth(0.025)),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Padding _pageDivider(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: const Divider(
        height: 2,
        color: Colors.black12,
      ),
    );
  }

  Positioned _quantityButton(
    BuildContext context, {
    bool? isLeft,
    required String text,
  }) {
    return Positioned(
      top: 0,
      left: (isLeft ?? false) ? 0 : null,
      right: (isLeft ?? false) ? null : 0,
      child: CustomElevatedButton(
        shape: RoundedRectangleBorder(
            borderRadius: context.border.lowBorderRadius),
        onPressed: () {},
        width: context.sized.dynamicHeight(0.06),
        height: context.sized.dynamicHeight(0.06),
        child: Text(
          text,
          style: context.general.textTheme.titleLarge,
        ),
      ),
    );
  }
}
