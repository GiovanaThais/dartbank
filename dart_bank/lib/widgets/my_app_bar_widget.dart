import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          color: Colors.green,
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    'https://icones.pro/wp-content/uploads/2021/10/symbole-bancaire-vert.png',
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Dart Bank',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.expand_more)
            ],
          ),
        ),
      ],
    );
  }
}
