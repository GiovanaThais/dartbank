import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset('assets/icon/avatar.png'),
          title: Text("User 1"),
          subtitle: Text("Olá \n Tudo bem?"),
          trailing: PopupMenuButton<String>(
              onSelected: (menu) {},
              itemBuilder: (BuildContext bc) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem(
                    child: Text("Option 1"),
                    value: "opção 1",
                  )
                ];
              }),
          isThreeLine: true,
        ),
        ListTile(
          leading: Image.asset('assets/icon/avatar.png'),
          title: const Text("User 2"),
          subtitle: const Text("Olá"),
          trailing: const Icon(Icons.access_time),
        ),
      ],
    );
  }
}
