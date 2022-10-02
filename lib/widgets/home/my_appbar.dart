import 'package:flutter/material.dart';

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
            children: [
              BigText(
                text: title,
                fontSize: 40.0,
                colors: Colors.greenAccent,
              ),
              SmallText(
                text: 'Delivery is in us!!!',
              )
            ],
          ),
          Center(
            child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.greenAccent, width: 4.0),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
