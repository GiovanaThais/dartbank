import 'package:dart_bank/pages/home/page1.dart';
import 'package:dart_bank/pages/home/page2.dart';
import 'package:dart_bank/pages/home/page3.dart';
import 'package:dart_bank/pages/home/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagePosition = 0;
  PageController controller = PageController(initialPage: 0);
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
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
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
        body: Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                pagePosition = value;
              });
            },
            scrollDirection: Axis.vertical,
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: pagePosition,
            items: const [
              BottomNavigationBarItem(label: "Pag1", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.person)),
            ]),
      ),
    );
  }
}
