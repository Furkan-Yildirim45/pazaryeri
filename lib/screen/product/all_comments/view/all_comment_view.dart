import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/extension/context/border_Radius.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';
import 'package:untitled/product/widget/general_app_bar.dart';

import '../../../../product/utility/page_utility/product_detail_utility.dart';
import '../../../../product/widget/general_shadow.dart';
import '../../product_detail/model/comment_model.dart';

class AllCommentView extends StatefulWidget {
  const AllCommentView({super.key, required this.commentItems});
  final List<CommentModel> commentItems;

  @override
  State<AllCommentView> createState() => _AllCommentViewState();
}

class _AllCommentViewState extends State<AllCommentView> with ProductDetailUtility{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ProjectColor.lightGrey.getColor(),
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),isLeadingActive: true,),
        body: SafeArea(
          child: Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: context.padding.horizontalMedium,
                  child: Column(
                    children: [
                      buildSellerAndProductInfo(context),
                      SizedBox(
                        width: context.sized.width,
                        height: widget.commentItems.length * context.sized.dynamicHeight(0.174),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.commentItems.length,
                          itemBuilder: (context, index) {
                            return buildCommentWithDivider(context, index,
                                commentItems: widget.commentItems);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
        height: context.sized.dynamicHeight(0.08),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [generalShadow()],
          borderRadius: context.myBorder.dynamicBorderRadiusOnly(topRight: 0.04,topLeft: 0.04)
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBottomNavBarButton(context: context,text: "Yorum Yap",),
              buildBottomNavBarButton(context: context,text: "Yorum Yap",backgroundColor: ProjectColor.apricot.getColor(),textColor: Colors.white),
            ],
          ),
      )
    );
  }

  CustomElevatedButton buildBottomNavBarButton({
  required BuildContext context,
    required String text,
    Color? textColor,
    Color? backgroundColor
}) {
    return CustomElevatedButton(
              width: context.sized.dynamicWidth(0.36),
                onPressed: (){},
              shape: RoundedRectangleBorder(borderRadius: context.border.lowBorderRadius,side: BorderSide(width: 1,color: ProjectColor.apricot.getColor())),
              backgroundColor: backgroundColor ?? Colors.white,
                child: Text(text,
                style: context.general.textTheme.titleSmall?.copyWith(color: textColor ?? ProjectColor.apricot.getColor(),),),
            );
  }
}
