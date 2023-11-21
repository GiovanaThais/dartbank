// ignore_for_file: prefer_const_constructors

import 'package:dart_bank/repositories/account_types_repository.dart';
import 'package:dart_bank/widgets/text_label_widgets.dart';
import 'package:flutter/material.dart';

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
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var cepController = TextEditingController(text: "");
  var numberAddController = TextEditingController(text: "");
  var cityAddController = TextEditingController(text: "");
  var stateAddController = TextEditingController(text: "");
  var roadAddController = TextEditingController(text: "");
  var neighborhoodAddController = TextEditingController(text: "");
  DateTime? birthDate;
  var typesRepository = AccountTypesRepository();
  var types = [];
  var typeSelected = "";

  @override
  void initState() {
    // TODO: implement initState
    types = typesRepository.returnTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cadastro")),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TextLabel(
            textlabel: "Nome Completo",
          ),
          TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          const TextLabel(
            textlabel: "cpf",
          ),
          TextField(
            controller: numberIdController,
          ),
          const TextLabel(
            textlabel: "Telefone",
          ),
          TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.no_cell_rounded,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          TextLabel(textlabel: "Data de nascimento"),
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
          const TextLabel(
            textlabel: "email",
          ),
          TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          const TextLabel(
            textlabel: "senha",
          ),
          TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                Icons.key,
                color: Color.fromARGB(255, 23, 134, 71),
              ))),
          const TextLabel(textlabel: "Tipo de conta:"),
          Column(
              children: types
                  .map((type) => RadioListTile(
                      dense: true,
                      title: Text(type.toString()),
                      selected: typeSelected == type,
                      value: type.toString(),
                      groupValue: typeSelected,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          typeSelected = value.toString();
                        });
                      }))
                  .toList()),
          const TextLabel(
            textlabel: "rua",
          ),
          TextField(
            controller: roadAddController,
          ),
          const TextLabel(
            textlabel: "bairro",
          ),
          TextField(
            controller: neighborhoodAddController,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextLabel(textlabel: "CEP"),
                        TextField(controller: cepController),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextLabel(textlabel: "Número"),
                        TextField(controller: numberAddController),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextLabel(textlabel: "Cidade"),
                        TextField(controller: cityAddController),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextLabel(textlabel: "Estado"),
                        TextField(controller: stateAddController),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  if (nameController.text.trim().length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Nome deve ser preenchido")));
                    return;
                  }
                  if (birthDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Data de nascimento deve ser preenchida!")));
                    return;
                  }
                  if (typeSelected.trim() == "") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("O tipo de conta deve ser selecionada")));
                    return;
                  }
                  print(nameController.text);
                  print(birthDate);
                  print(typeSelected);
                },
                child: Text("Salvar")),
          )
        ]),
      ),
    );
  }
}
