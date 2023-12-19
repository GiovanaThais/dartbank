import 'package:dart_bank/features/home/repositories/app_images_repository.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: cardListMethod(),
          ),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }

  ListView cardListMethod() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Card(
            elevation: 9,
            child: Image.asset(
              AppImages.img1,
              height: 50,
            )),
        Card(
            elevation: 9,
            child: Image.asset(
              AppImages.img2,
              height: 50,
            )),
        Card(
            elevation: 9,
            child: Image.asset(
              AppImages.img3,
              height: 50,
            )),
      ],
    );
  }
}
