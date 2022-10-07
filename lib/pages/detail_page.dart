import 'package:flutter/material.dart';

import './../utils/dimension.dart';
import './../widgets/big_text.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x0000e900),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: Dimensions.height350,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image/food0.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
