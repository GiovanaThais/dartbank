import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreferences storage;

  String? userName;
  String? email;
  bool darkTheme = false;
  bool pushNotification = false;

  final PUSH_NOTIFICATION_KEY = "PUSH_NOTIFICATION_KEY";
  final DARK_THEME_KEY = "DARK_THEME_KEY";

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  loadingData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      pushNotification = storage.getBool(PUSH_NOTIFICATION_KEY) ?? false;
      darkTheme = storage.getBool(DARK_THEME_KEY) ?? false;
    });
  }

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
                        onPressed: () async {
                          await storage.setBool(
                              PUSH_NOTIFICATION_KEY, pushNotification);

                          await storage.setBool(DARK_THEME_KEY, darkTheme);
                          Navigator.pop(context);
                        },
                        child: const Text("Salvar")))
              ]),
            )));
  }
}
