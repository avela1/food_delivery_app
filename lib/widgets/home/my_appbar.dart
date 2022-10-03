import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimension.dart';

import '../big_text.dart';
import '../small_text.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: title,
                fontSize: Dimensions.height50,
                colors: Colors.greenAccent,
              ),
              SmallText(
                text: 'Delivery is in us!!!',
              )
            ],
          ),
          Center(
            child: Container(
              height: Dimensions.height45,
              width: Dimensions.height45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10),
                border: Border.all(
                    color: Colors.greenAccent, width: Dimensions.height03),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: Dimensions.height25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
