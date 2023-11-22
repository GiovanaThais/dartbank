// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:dart_bank/core/widgets/text_label_widgets.dart';
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
        title: Center(child: Text("Cadastro")),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(// Troquei o column por listview pq já tem Scroll
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: const TextLabel(
              textlabel: "Nome Completo",
            ),
          ),
          TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: const TextLabel(
              textlabel: "cpf",
            ),
          ),
          TextField(
            controller: numberIdController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: const TextLabel(
              textlabel: "Telefone",
            ),
          ),
          TextField(
              controller: cellController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.dialer_sip,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextLabel(textlabel: "Data de nascimento"),
          ),
          TextField(
            controller: birthDateController,
            readOnly: true,
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
            child: const TextLabel(
              textlabel: "email",
            ),
          ),
          TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const TextLabel(
              textlabel: "senha",
            ),
          ),
          TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.key,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: const TextLabel(textlabel: "Tipo de conta:"),
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
            child: const TextLabel(
              textlabel: "rua",
            ),
          ),
          TextField(
            controller: streetAddController,
            decoration: const InputDecoration(
                prefixIcon: Icon(
              Icons.add_road,
              color: Color.fromARGB(255, 23, 134, 71),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: const TextLabel(
              textlabel: "bairro",
            ),
          ),
          TextField(
            controller: neighborhoodAddController,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: const TextLabel(textlabel: "CEP"),
              ),
              TextField(controller: cepController),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: const TextLabel(textlabel: "Número"),
                        ),
                        TextField(controller: numberAddController),
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
                          child: const TextLabel(textlabel: "Cidade"),
                        ),
                        TextField(controller: cityAddController),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: const TextLabel(textlabel: "Estado"),
              ),
              TextField(controller: stateAddController),
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
