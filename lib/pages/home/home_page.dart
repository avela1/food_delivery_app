import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Food Delivery'),
        ),
        body: const Center(
          child: Text('home page'),
        ),
      ),
    );
  }
}
