import 'package:dart_bank/pages/home/home_page.dart';
import 'package:dart_bank/pages/home/register_page.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
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
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  'assets/icon/logo.png',
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Seja bem-vindo ao Dart Bank!',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Já possui conta? Identifique-se ",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
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
                          height: 5,
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
                                  color: Color.fromARGB(255, 23, 134, 71),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              navigateToHomePage();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 23, 134, 71)),
                            ),
                            child: const Text(
                              "Entrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 30,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: const Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 23, 134, 71)),
                            ),
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 30,
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: const Text(
                              "Cadastre-se",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 23, 134, 71)),
                            ),
                          ),
                          onTap: () {
                            navigateToRegisterPage();
                          },
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
