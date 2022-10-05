import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../icon_text.dart';

class ListviewBuilder extends StatelessWidget {
  const ListviewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.height20,
            vertical: Dimensions.height05,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: Dimensions.imgContainerwitdth,
                height: Dimensions.imgContainerwitdth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/image/food0.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: Dimensions.textContainerwitdth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.height15),
                      bottomRight: Radius.circular(Dimensions.height15),
                    ),
                    color: const Color.fromARGB(221, 57, 57, 57),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BigText(
                          text: 'Amazing Ethiopia Dorowot',
                          fontSize: 25,
                        ),
                        SmallText(text: 'with chikin prize salad'),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }
}
