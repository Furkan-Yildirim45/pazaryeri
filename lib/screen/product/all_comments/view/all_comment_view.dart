import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/extension/context/border_Radius.dart';
import 'package:untitled/product/utility/welcome_utility.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';

import '../../../../product/utility/product_detail_utility.dart';
import '../../product_detail/model/comment_model.dart';

class AllCommentView extends StatefulWidget {
  const AllCommentView({super.key, required this.commentItems});
  final List<CommentModel> commentItems;

  @override
  State<AllCommentView> createState() => _AllCommentViewState();
}

class _AllCommentViewState extends State<AllCommentView> with WelcomeUtility,ProductDetailUtility{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ProjectColor.lightGrey.getColor(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: context.myBorder.dynamicBorderRadiusOnly(
          bottomLeft: 0.05,bottomRight: 0.05,
        )),
        toolbarHeight: context.sized.dynamicHeight(0.12),
        title: Align(alignment: Alignment.center,child: marketPlaceTitle(context)),
        leadingWidth: context.sized.dynamicWidth(0.16),
        leading: Padding(
          padding: context.padding.onlyTopMedium,
          child: _buildAppBarButton(context, onPressed: (){context.route.pop();}, child: Icon(Icons.arrow_back_outlined,size:
            context.sized.mediumValue,color: ProjectColor.apricot.getColor(),))
        ),
        actions: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: context.padding.onlyTopMedium,
              child: _buildAppBarButton(context,
                  onPressed: () {},
                  child: Image.asset(
                    "assets/images/notification_appbar.png",
                    color: ProjectColor.apricot.getColor(),
                    height: context.sized.mediumValue,
                    width: context.sized.mediumValue,
                  )),
            ),
          ),
        ],
      ),
        body: SafeArea(
          child: Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: context.padding.horizontalMedium,
                  child: Column(
                    children: [
                      buildSellerAndProductInfo(context),
                      Container(
                        width: context.sized.width,
                        height: widget.commentItems.length *
                            context.sized.dynamicHeight(0.174),
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
          boxShadow: [buildGeneralShadow()],
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

  CustomElevatedButton _buildAppBarButton(BuildContext context,{
    required void Function() onPressed,
    required Widget child,
}) {
    return CustomElevatedButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: context.border.normalBorderRadius),
            onPressed: onPressed,
            width: context.sized.dynamicWidth(0.16),
            height: context.sized.dynamicHeight(0.12),
            child: child,
          );
  }
}
