import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';
import 'package:untitled/product/widget/page_divider.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black12, width: 1)),
        title: Text(
          "Sipariş Detayları",
          style: context.general.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: context.padding.onlyRightNormal,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: ListView(
            children: [
              _buildOrderSummary(context),
              Container(
                padding: EdgeInsets.all(context.sized.normalValue),
                margin: context.padding.onlyTopNormal,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: context.border.normalBorderRadius,
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                width: double.infinity,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Teslimat Tarihi: 14.05.2024',
                      style: _buildBodyLarge(context),
                    ),
                    Text(
                      'Teslimat No: 28462748',
                      style: _buildBodyLarge(context),
                    ),
                    CustomPageDivider(),
                    Padding(
                      padding: context.padding.onlyTopLow,
                      child: Row(
                        children: [
                          Text(
                            'Satıcı: Teal Collection',
                            style: _buildBodyLarge(context),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: context.sized.normalValue,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: context.padding.onlyTopLow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildProductInfoMenuButton(
                            context: context,
                            text: "Satıcıyı Değerlendir",
                            onPressed: (){},
                          ),
                          _buildProductInfoMenuButton(
                            onPressed: (){},
                            context: context,
                            text: "Satıcıyı Takip Et",
                            backgroundColor: Colors.white,
                            width: context.sized.dynamicWidth(0.35),
                            textColor: ProjectColor.apricot.getColor(),
                            child: Text('Satıcıyı Değerlendir',
                            style: context.general.textTheme.labelLarge?.copyWith(color: ProjectColor.apricot.getColor(),fontWeight: FontWeight.w700),)),
                        ],
                      ),
                    ),
                    CustomPageDivider(),
                    Padding(
                      padding: context.padding.onlyTopNormal,
                      child: Row(
                        children: [
                          Padding(
                            padding: context.padding.onlyRightLow,
                            child: const Icon(Icons.task_alt_outlined,color: Colors.green,),
                          ),
                          Text('Teslim Edildi',style: context.general.textTheme.labelLarge?.copyWith(color: Colors.green,fontWeight: FontWeight.w700),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: context.padding.onlyTopLow,
                      child: Row(
                        children: [
                          Padding(
                            padding: context.padding.onlyRightLow,
                            child: const Icon(Icons.info_outline, color: Colors.green),
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Aşağıdaki 1 ürün ',
                                    style: _buildLabelLarge(context,color: Colors.black45),
                                  ),
                                  TextSpan(
                                    text: '13 Eylül Çarşamba ',
                                    style: _buildLabelLarge(context,color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'günü teslim edilmiştir.',
                                    style: _buildLabelLarge(context,color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: context.sized.dynamicHeight(0.05),
                      padding: context.padding.horizontalLow,
                      margin: context.padding.onlyTopLow,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.black26),
                        borderRadius: context.border.lowBorderRadius,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Kargo Firması: ',
                                  style: _buildLabelLarge(context,color: Colors.black45),
                                ),
                                TextSpan(
                                  text: 'Aras Kargo',
                                  style: _buildLabelLarge(context,color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Text('Teslimat Detay',style:
                            _buildLabelLarge(context,color: ProjectColor.apricot.getColor(),fontWeight: FontWeight.w700),)
                        ],
                      ),
                    ),

                    //todo: burda kaldın!
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle? _buildLabelLarge(BuildContext context,
      {Color? color, FontWeight? fontWeight}) =>
      context.general.textTheme.labelLarge?.copyWith(color: color, fontWeight:fontWeight);

  CustomElevatedButton _buildProductInfoMenuButton(
  {
    required BuildContext context,
    Widget? child,
    required void Function() onPressed,
    Color? backgroundColor,
    Color? textColor,
    double? width,
    required String text,
  }) {
    return CustomElevatedButton(
      shape: RoundedRectangleBorder(
        borderRadius: context.border.lowBorderRadius,
        side: BorderSide(color: ProjectColor.apricot.getColor())
      ),
      height: context.sized.dynamicHeight(0.06),
      backgroundColor: backgroundColor ?? ProjectColor.apricot.getColor(),
      width: width ?? context.sized.dynamicWidth(0.45),
      padding: context.padding.horizontalNormal,
      onPressed: onPressed,
      child: child ??
          Row(
            children: [
              Padding(
                padding: context.padding.onlyRightLow,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: context.sized.dynamicHeight(0.022),
                    child: Icon(
                      Icons.storefront_outlined,
                      color: ProjectColor.apricot.getColor(),
                    )),
              ),
              Text(text,
                  style: context.general.textTheme.labelLarge?.copyWith(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w700)),
            ],
          ),
    );
  }

  Container _buildOrderSummary(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopNormal,
      padding: EdgeInsets.all(context.sized.normalValue),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.border.normalBorderRadius,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sipariş No: 224507753',
            style: _buildBodyLarge(context),
          ),
          Text('Sipariş Tarihi: 14.05.2024', style: _buildBodyLarge(context)),
          Row(
            children: [
              Text('Sipariş Özeti: ', style: _buildBodyLarge(context)),
              Text('1 Teslimat, ',
                  style: _buildBodyLarge(context, color: Colors.green)),
              Text('1 Ürün', style: _buildBodyLarge(context)),
            ],
          ),
          Row(
            children: [
              Text('Sipariş Detayı: ', style: _buildBodyLarge(context)),
              Text('1 Ürün Teslim Edildi',
                  style: _buildBodyLarge(context, color: Colors.green)),
            ],
          ),
          Row(
            children: [
              Text('Toplam: ', style: _buildBodyLarge(context)),
              Text('399.00 TL',
                  style: _buildBodyLarge(context,
                      color: ProjectColor.apricot.getColor())),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle? _buildBodyLarge(BuildContext context, {Color? color}) =>
      context.general.textTheme.bodyLarge
          ?.copyWith(color: color, fontWeight: FontWeight.w500);
}
