import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      children: [
        Container(
          color: const Color.fromARGB(255, 242, 255, 243),
          child: CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: 1.0,
            center: const Text("100%"),
            progressColor: Colors.green,
            animation: true,
            animationDuration: 1200,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ),
        Card(
          child: Container(
            color: Color.fromARGB(255, 180, 239, 192),
            child: Text("Saldo atual:"),
          ),
        )
      ],
    );
  }
}
