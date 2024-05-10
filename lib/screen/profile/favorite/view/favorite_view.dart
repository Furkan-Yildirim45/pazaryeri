import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/widget/general_search_bar.dart';

import '../../../../product/utility/page_utility/profile/favorite_utility.dart';

class FavoriteView extends StatelessWidget with FavoriteUtility{
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const GeneralSearchBar(),
              Expanded(
                child: Padding(
                  padding: context.padding.onlyTopNormal,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: context.border.lowBorderRadius),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildProductDetailWithoutButton(context, index),
                            buildProductDetailButton(context, width: double.infinity,title: 'Sepete Ekle'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
