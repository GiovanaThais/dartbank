import 'package:dart_bank/features/auth/register/register_page.dart';
import 'package:dart_bank/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../../core/components/wave_clipper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool isObscureText = true;

  void navigateToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const HomePage(
                title: '',
              )),
    );
    //ScaffoldMessenger.of(context)
    //    .showSnackBar(const SnackBar(content: Text("Erro ao efetuar login")));
  }

  void navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: size.height,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 45,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 171, 213, 168),
                            Color.fromARGB(255, 92, 184, 92),
                          ],
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/logo.png',
                              width: 0.55 *
                                  size.width, // o Image tem tamanho, não precisa colocar expanded com container vazio
                              height: 0.25 *
                                  size.height, // o Image tem tamanho, não precisa colocar expanded com container vazio
                            ),
                            SizedBox(
                              height: 0.01 * size.height,
                            ),
                            const Text('Seja bem-vindo ao Dart Bank!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(
                              height: 0.01 * size.height,
                            ),
                            const Text(
                              "Já possui conta? Identifique-se ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 55,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 22,
                        ),
                        TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          style: const TextStyle(color: Colors.black),
                          //children: [
                          decoration: const InputDecoration(
                              hintText: "Insira seu email",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 23, 134, 71)),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 23, 134, 71),
                              )),
                          //Expanded(flex: 4, child: Text("Informe seu email:")),
                          // Expanded(flex: 4, child: Text('Email'))
                          //],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          obscureText: isObscureText,
                          onChanged: (value) {
                            password = value;
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Insira sua senha",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 23, 134, 71)),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Color.fromARGB(255, 23, 134, 71),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color.fromARGB(255, 23, 134, 71),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    navigateToHomePage();
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(255, 23, 134, 71)),
                                  ),
                                  child: const Text(
                                    "Entrar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              // Expanded(child: Container()), não entendi esse container
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  height: 30,
                                  color: Colors.transparent,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Esqueci minha senha",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 23, 134, 71)),
                                  ),
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  height: 30,
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  child: const Text(
                                    "Cadastre-se",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 23, 134, 71)),
                                  ),
                                ),
                                onTap: () {
                                  navigateToRegisterPage();
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
