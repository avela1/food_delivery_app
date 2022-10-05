import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import './../../utils/dimension.dart';
import './pageview_builder_item.dart';

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({super.key});

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPage = 0.0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.pageview,
          child: PageView.builder(
              itemCount: 5,
              controller: _pageController,
              itemBuilder: (context, index) {
                return PageviewBuilderItem(
                  index: index,
                  currentPage: _currentPage,
                );
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: Colors.greenAccent,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
}
