import 'package:flutter/material.dart';

import '../../utils/dimension.dart';
import '../big_text.dart';
import '../icon_text.dart';
import '../small_text.dart';

class PageviewBuilderItem extends StatelessWidget {
  final int index;
  final double currentPage;

  const PageviewBuilderItem(
      {Key? key, required this.index, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const scaleFactor = 0.8;
    final height = Dimensions.pageviewContainer;
    Matrix4 matrix = Matrix4.identity();

    if (index == currentPage.floor()) {
      var currScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPage.floor() + 1) {
      var currScale =
          scaleFactor + (currentPage - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPage.floor() - 1) {
      var currScale = 1 - (currentPage - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageviewContainer,
            width: double.infinity,
            margin: EdgeInsets.only(
                left: Dimensions.height10, right: Dimensions.height10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.height20),
              child: Image.asset(
                'assets/image/food0.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageviewTextContainer,
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: Dimensions.height35,
                    right: Dimensions.height35,
                    bottom: Dimensions.height35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height20),
                    color: const Color.fromARGB(221, 57, 57, 57),
                    // color: Colors.black,
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
                  padding: EdgeInsets.all(Dimensions.height15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      BigText(text: 'Chinese Food'),
                      SizedBox(
                        height: Dimensions.height05,
                      ),
                      Row(
                        children: <Widget>[
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                size: Dimensions.height15,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width02),
                          SmallText(text: "4.5"),
                          SizedBox(width: Dimensions.width10),
                          SmallText(text: "1280"),
                          SizedBox(width: Dimensions.width02),
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
