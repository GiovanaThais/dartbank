import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dart_bank/core/widgets/custom_drawer_widget.dart';
import 'package:dart_bank/features/home/pages/page4.dart';
import 'package:dart_bank/features/tasks/pages/task_page.dart';
import 'package:flutter/material.dart';

import 'card_page.dart';
import 'percent_indicator_page/page2.dart';
import 'chat/page3.dart';

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
    const Page4(),
    const TaskPage()
  ];

  final navigationBarList = const [
    TabItem(title: "Cards", icon: Icon(Icons.home)),
    TabItem(title: "Pag2", icon: Icon(Icons.add)),
    TabItem(title: "Pag3", icon: Icon(Icons.person)),
    TabItem(title: "Pag4", icon: Icon(Icons.photo_album)),
    TabItem(title: "Tarefas", icon: Icon(Icons.task)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DartBank"),
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
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.reactCircle,
          //convertido BottomNavigationBarItem em tabItem
          items: navigationBarList,
          backgroundColor: Colors.green,
          onTap: (int value) {
            controller.jumpToPage(value);
          },
          color: Colors.white,
          initialActiveIndex: pagePosition,
        ),
      ),
    );
  }
}
