import 'package:flutter/material.dart';

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
            children: const [
              MyAppBar(title: 'Order Food'),
              PageViewBuilder(),
            ],
          )),
    );
  }
}
