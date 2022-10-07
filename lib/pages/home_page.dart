import 'package:flutter/material.dart';

import './../utils/dimension.dart';

import './../widgets/big_text.dart';
import './../widgets/small_text.dart';
import './../widgets/home/listview_builder.dart';
import '../widgets/home/my_appbar.dart';
import '../widgets/home/pageview_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x0000e900),
        body: Column(
          children: [
            const MyAppBar(title: 'Order Food'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PageViewBuilder(),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.height20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          BigText(text: 'Populars'),
                          SizedBox(
                            width: Dimensions.height05,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height05),
                            child: BigText(
                              text: '.',
                              colors: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.height05,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height10),
                            child: SmallText(
                              text: 'Food Paring',
                              fontSize: Dimensions.height10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ListviewBuilder(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
