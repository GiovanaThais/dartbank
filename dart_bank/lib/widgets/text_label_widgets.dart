import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String textlabel;
  const TextLabel({super.key, required this.textlabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: Text(
        textlabel,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
