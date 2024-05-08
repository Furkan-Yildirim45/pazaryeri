import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../utility/project_utility/image_utility.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _pageSlider(),
        _sliderTinyCircle(context),
      ],
    );
  }

  Positioned _sliderTinyCircle(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
              (index) => Padding(
            padding: EdgeInsets.all(context.sized.lowValue),
            child: Container(
              width: index == _currentPage ? 10 : 5,
              height: context.sized.lowValue,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == _currentPage ? Colors.white24 : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
  PageView _pageSlider() {
    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: context.border.normalBorderRadius,
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: context.border.normalBorderRadius,
              child: Image.asset(
                ImageUtility.getImagePath("resim1"), //todo:black_firday olcak
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}