import 'package:dart_bank/features/auth/register/register_page.dart';
import 'package:dart_bank/features/home/pages/setting_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/auth/login/login_page.dart';

import 'package:share_plus/share_plus.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: itemsDrawerMethod(context),
      ),
    );
  }

  Column itemsDrawerMethod(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        avatarAccountMethod(context),
        registerUsersMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        useTermsMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        settingsMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        translateMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        sharedMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        sharedSitesMethod(context),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        exitMethod(context),
      ],
    );
  }

  InkWell exitMethod(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.exit_to_app),
            SizedBox(
              width: 5,
            ),
            Text("Sair"),
          ],
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                alignment: Alignment.centerLeft,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: const Text("Dart Bank"),
                content: const Wrap(
                  children: [
                    Text("Voce sairá do aplicativo!"),
                    Text("Deseja realmente sair do aplicativo?"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Não")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text("Sim"))
                ],
              );
            });
      },
    );
  }

  InkWell registerUsersMethod(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            FaIcon(
              FontAwesomeIcons.userGear,
              color: Colors.black,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text("Dados cadastráis"),
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
    );
  }

  InkWell settingsMethod(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.settings),
            SizedBox(
              width: 5,
            ),
            Text("Configurações"),
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
      },
    );
  }

  InkWell useTermsMethod(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: const Row(
          children: [
            Icon(Icons.info),
            SizedBox(
              width: 5,
            ),
            Text("Termos de uso e privacidade"),
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            context: context,
            builder: (BuildContext bc) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: const Column(
                    children: [
                      Text(
                        "Termos de uso e privacidade",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        " Podemos já vislumbrar o modo pelo qual a mobilidade dos capitais internacionais ainda não demonstrou convincentemente que vai participar na mudança das regras de conduta normativas. A certificação de metodologias que nos auxiliam a lidar com o novo modelo estrutural aqui  proposições. atuação assume importantes posições no estabelecimento das direções preferenciais no sentido do progresso.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ));
            });
      },
    );
  }

  InkWell avatarAccountMethod(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            context: context,
            builder: (BuildContext bc) {
              return const Wrap(
                children: [
                  ListTile(
                    title: Text("Camera"),
                    leading: Icon(Icons.photo_camera),
                  ),
                  ListTile(
                    title: Text("Galeria"),
                    leading: Icon(Icons.photo_library),
                  )
                ],
              );
            });
      },
      child: UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 239, 255, 248),
            child: Image.asset(
              'assets/icon/avatar.png',
              width: 60,
            ),
          ),
          accountName: const Text("User"),
          accountEmail: const Text("email@email.com")),
    );
  }
}

InkWell translateMethod(BuildContext context) {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: const Row(
        children: [
          FaIcon(
            FontAwesomeIcons.earthAmericas,
          ),
          SizedBox(
            width: 5,
          ),
          Text("Traduzir"),
        ],
      ),
    ),
    onTap: () {
      Navigator.pop(context); //TODO: MUDAR PARA DRAWERCLOSE
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
    },
  );
}

InkWell sharedMethod(BuildContext context) {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: const Row(
        children: [
          FaIcon(
            FontAwesomeIcons.share,
          ),
          SizedBox(
            width: 5,
          ),
          Text("Compartilhar"),
        ],
      ),
    ),
    onTap: () {
      Navigator.pop(context); //TODO: MUDAR PARA DRAWERCLOSE
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
    },
  );
}

InkWell sharedSitesMethod(BuildContext context) {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: const Row(
        children: [
          FaIcon(
            FontAwesomeIcons.mapLocationDot,
          ),
          SizedBox(
            width: 5,
          ),
          Text("Abrir Google Maps"),
        ],
      ),
    ),
    onTap: () async {
      Navigator.pop(context); //TODO: MUDAR PARA DRAWERCLOSE
      await launchUrl(Uri.parse("google.navigation:q=Orlando FL&mode=d"));
    },
  );
}
