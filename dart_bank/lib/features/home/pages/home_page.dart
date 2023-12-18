import 'package:dart_bank/core/widgets/custom_drawer_widget.dart';
import 'package:dart_bank/features/home/pages/page4.dart';
import 'package:flutter/material.dart';

import 'card_page.dart';
import 'page2.dart';
import 'page3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagePosition = 0;
  PageController controller = PageController(initialPage: 0);

  // colocar as listas em variaveis
  final pagesList = <Widget>[
    const CardPage(),
    const Page2(),
    const Page3(),
    const Page4()
  ];

  final navigationBarList = const [
    BottomNavigationBarItem(label: "Cards", icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
    BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.person)),
    BottomNavigationBarItem(label: "Pag4", icon: Icon(Icons.accessible)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const CustomDrawerWidget(),

        // body: Expanded(): o weidget expanded é pra ser usado dentro de columns/rows, não precisa dele aqui, o body já é todo o espaço entre a appbar e a bottombar, removi
        body: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              pagePosition = value;
            });
          },
          scrollDirection: Axis.vertical,
          children: pagesList,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: pagePosition,
            items: navigationBarList),
      ),
    );
  }
}
