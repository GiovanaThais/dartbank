import 'package:dart_bank/services/app_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppStorageService storage = AppStorageService();

  String? userName;
  String? email;
  bool darkTheme = false;
  bool pushNotification = false;

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  loadingData() async {
    pushNotification = await storage.getSettingsPushNotifier();
    darkTheme = await storage.getSettingsDarkTheme();
    setState(() {});
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
                          await storage
                              .setSettingsPushNotifier(pushNotification);

                          await storage.setSettingsDarkTheme(darkTheme);
                          //Navigator.pop(context);
                        },
                        child: const Text("Salvar")))
              ]),
            )));
  }
}
