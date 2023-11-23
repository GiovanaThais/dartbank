// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:dart_bank/core/widgets/text_label_widgets.dart';
import 'package:dart_bank/features/auth/components/person_components.dart';
import 'package:flutter/material.dart';

import '../repositories/account_types_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var nameController = TextEditingController(text: "");
  var birthDateController = TextEditingController(text: "");
  var numberIdController = TextEditingController(text: "");
  var cellController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var cepController = TextEditingController(text: "");
  var numberAddController = TextEditingController(text: "");
  var cityAddController = TextEditingController(text: "");
  var stateAddController = TextEditingController(text: "");
  var streetAddController = TextEditingController(text: "");
  var neighborhoodAddController = TextEditingController(text: "");
  DateTime? birthDate;
  var typesRepository = AccountTypesRepository();
  var types = [];
  var typeSelected = "";

  @override
  void initState() {
    super.initState(); // super.initState() sempre no começo
    types = typesRepository.returnTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(// Troquei o column por listview pq já tem Scroll
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Card(
            child: ExpansionTile(
              title: Text("Person Form"),
              children: const [
                PersonComponent(),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text("Login Form"),
              children: const [
                PersonComponent(),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              title: Text("Address Form"),
              children: const [
                PersonComponent(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(
              controller: nameController,
              textlabel: "Nome Completo",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(
              controller: numberIdController,
              textlabel: "CPF",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(
              controller: cellController,
              textlabel: "Telefone",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text("Data de nascimento:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          TextField(
            readOnly: true,
            controller: birthDateController,
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000, 1, 1),
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime.now());
              if (date != null) {
                birthDateController.text = date.toString();
                birthDate = date;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(
              controller: emailController,
              textlabel: "Email",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(
              controller: passwordController,
              textlabel: "Senha",
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "Tipo de conta:",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 63, 64, 64)),
            ),
          ),
          Column(
              children: types
                  .map((type) => RadioListTile(
                      dense: true,
                      title: Text(type.toString()),
                      selected: typeSelected == type,
                      value: type.toString(),
                      groupValue: typeSelected,
                      onChanged: (value) {
                        log('$value'); // log deixa o print destacado no console
                        setState(() {
                          typeSelected = value.toString();
                        });
                      }))
                  .toList()),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(
              controller: streetAddController,
              textlabel: "Rua",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(
              controller: neighborhoodAddController,
              textlabel: "Bairro",
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(controller: cepController, textlabel: "CEP"),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: TextLabel(
                              controller: numberAddController,
                              textlabel: "Número"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: TextLabel(
                              controller: cityAddController,
                              textlabel: "Cidade"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextLabel(
                    controller: stateAddController, textlabel: "Estado"),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: TextButton(
              // Separar código em um metodo
              onPressed: _onSavePressed, child: Text("Salvar"),
            ),
          )
        ]),
      ),
    );
  }

  void _onSavePressed() {
    if (nameController.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nome deve ser preenchido")));
      return;
    }
    if (birthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Data de nascimento deve ser preenchida!")));
      return;
    }
    if (typeSelected.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("O tipo de conta deve ser selecionada")));
      return;
    }
    if (cellController.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Telefone deve ser adicionado!")));
      return;
    }
    log(nameController.text);
    log('$birthDate');
    log(typeSelected);
  }
}
