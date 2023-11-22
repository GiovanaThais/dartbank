import 'package:dart_bank/features/auth/register/register_page.dart';
import 'package:flutter/material.dart';

import 'page1.dart';
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
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  final navigationBarList = const [
    BottomNavigationBarItem(label: "Pag1", icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
    BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.person)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Dados cadastráis"),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Termos de uso e privacidade"),
                  ),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Configurações"),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
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
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: pagePosition,
            items: navigationBarList),
      ),
    );
  }
}