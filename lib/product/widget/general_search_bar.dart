
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';

class GeneralSearchBar extends StatefulWidget {
  const GeneralSearchBar({super.key});

  @override
  State<GeneralSearchBar> createState() => _GeneralSearchBarState();
}

class _GeneralSearchBarState extends State<GeneralSearchBar> {
  TextEditingController searchController = TextEditingController();
  List<String> searchedWord = [];

  void makeSearch(String word) {
    setState(() {
      searchedWord.add(word);
      searchController.clear();
    });
  }

  void delete(int index) {
    setState(() {
      searchedWord.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                            "İstediğiniz ürünü ve kategoriyi aratabilirsiniz",
                            hintStyle: context.general.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black54),
                          ),
                          onSubmitted: (word) {
                            makeSearch(word);
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
}
