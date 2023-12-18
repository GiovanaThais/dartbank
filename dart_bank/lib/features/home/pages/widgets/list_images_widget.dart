import 'package:flutter/material.dart';

import '../../repositories/app_images_repository.dart';

class ListImagesWidget extends StatefulWidget {
  const ListImagesWidget({super.key});

  @override
  State<ListImagesWidget> createState() => _ListImagesWidgetState();
}

class _ListImagesWidgetState extends State<ListImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.img1,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.img2,
          height: 50,
        ),
        Image.asset(
          AppImages.img3,
          height: 50,
        ),
      ],
    );
  }
}
