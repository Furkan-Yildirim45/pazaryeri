import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/extension/context/border_Radius.dart';
import 'package:untitled/product/init/init.dart';
import 'package:untitled/product/utility/product_detail_utility.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';
import 'package:untitled/screen/product/all_comments/view/all_comment_view.dart';

import '../model/comment_model.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> with ProductDetailUtility{
  List<CommentModel> commentItems = [];
  @override
  void initState() {
    commentItems = ProjectInit().generateDummyComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: context.sized.dynamicHeight(1.8), //componentlerin total heightleri burda olmalı
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
                              productShopName(context),
                              productNameAndCode(context, textStyle: context.general.textTheme.titleMedium?.copyWith(color: Colors.grey) ?? const TextStyle()),
                              productRating(context, starSize: context.sized.dynamicHeight(0.02)),
                              //ürün bilgisi content
                              Padding(
                                padding: context.padding.onlyTopNormal,
                                child: const Text('Yüzünüze parlaklık ve nem verir. Sivilce akne oluşumunu önler. Üstelik içindeki C vitamini sayesinde vücudunuzun cilt bariyerini güçlendirir.'),
                              ),
                              //divider
                              pageDivider(context),
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
                                      quantityButton(context,text: "-",isLeft: true),
                                      quantityButton(context, text: "+",isLeft: false)
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
                      height: context.sized.dynamicHeight(0.9),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: context.myBorder.dynamicBorderRadiusOnly(topRight: 0.08, topLeft: 0.08),
                        boxShadow: [
                          buildGeneralShadow(),
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
                          pageDivider(context),
                          Container(
                            margin: context.padding.onlyTopNormal,
                            height: context.sized.dynamicHeight(0.11),
                            width: context.sized.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //satıcı profile kutusu
                                sellerProfileContainer(context),
                                //Satıcı bilgisi ve ürün rating
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Emre Armağan / Satıcı',style:
                                      context.general.textTheme.titleMedium,),
                                    productRating(context, starSize: context.sized.dynamicHeight(0.02)),
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
                          Column(
                            children: [
                              Container(
                                padding: context.padding.horizontalNormal,
                                margin: context.padding.onlyTopNormal,
                                width: context.sized.width,
                                height: context.sized.dynamicHeight(0.5),
                                decoration: BoxDecoration(
                                  color: ProjectColor.lightGrey.getColor(),
                                  borderRadius: context.myBorder.dynamicBorderRadiusOnly(topLeft: 0.1,topRight: 0.1)
                                ),
                                child: Column(
                                  children: [
                                    //Satıcı ve ürün ön bilgisi değerlendirmeler için
                                    buildSellerAndProductInfo(context),
                                    //yorumlar ilk 2
                                    Expanded(
                                      child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          //yorum bileşeni
                                          return buildCommentWithDivider(context, index, commentItems: commentItems);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomElevatedButton(
                                  width: double.infinity,
                                  shape: RoundedRectangleBorder(borderRadius: context.myBorder.dynamicBorderRadiusOnly(bottomRight: 0.1, bottomLeft: 0.1,),),
                                  child: Text('Tümünü Gör (543)', style: context.general.textTheme.titleMedium?.copyWith(color: ProjectColor.apricot.getColor()),),
                                  onPressed: () {
                                    context.route.navigateToPage(AllCommentView(commentItems: commentItems,));
                                    },
                              ),
                            ],
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
}


class SecureNameWidget extends StatelessWidget {
  final String name;

  const SecureNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    String secureName = _getSecureName(name);
    return Text(secureName,style: context.general.textTheme.titleSmall,);
  }

  String _getSecureName(String name) {
    List<String> nameParts = name.split(' ');
    String secureName = '';
    for (String part in nameParts) {
      secureName += '${part[0].toUpperCase()}${'*' * (part.length - 1)} ';
    }
    return secureName.trim();
  }
}
