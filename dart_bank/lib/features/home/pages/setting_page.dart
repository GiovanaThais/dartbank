import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? userName;
  String? email;
  bool darkTheme = false;
  bool pushNotification = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("configurações")),
            body: Container(
              child: ListView(children: [
                SwitchListTile(
                    title: const Text("Receber notificações"),
                    value: pushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        pushNotification = !pushNotification;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Tema escuro"),
                    value: darkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        darkTheme = value;
                      });
                    }),
                Center(
                    child: TextButton(
                        onPressed: () {}, child: const Text("Salvar")))
              ]),
            )));
  }
}
