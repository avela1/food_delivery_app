import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../big_text.dart';
import '../icon_text.dart';
import '../small_text.dart';

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({super.key});

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPage = 0.0;
  final _scaleFactor = 0.8;
  final _height = 220;
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
          height: 320.0,
          child: PageView.builder(
              itemCount: 5,
              controller: _pageController,
              itemBuilder: (context, index) {
                return _buildPageView(index);
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

  Widget _buildPageView(index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPage.floor()) {
      var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPage.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPage.floor() - 1) {
      var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220.0,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/image/food0.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 120.0,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 35.0, right: 35.0, bottom: 35.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    // color: const Color.fromARGB(0, 0, 233, 0),
                    color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 0.1,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      BigText(text: 'Chinese Food'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          SmallText(text: "4.5"),
                          const SizedBox(width: 10.0),
                          SmallText(text: "1280"),
                          const SizedBox(width: 2.0),
                          SmallText(text: "comments"),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconText(
                            text: 'Normal',
                            iconColor: Colors.pink,
                            iconData: Icons.circle,
                          ),
                          IconText(
                            text: '1.2 KM',
                            iconColor: Colors.orange,
                            iconData: Icons.location_on,
                          ),
                          IconText(
                            text: '22 Min',
                            iconColor: Colors.greenAccent,
                            iconData: Icons.access_time_rounded,
                          )
                        ],
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
