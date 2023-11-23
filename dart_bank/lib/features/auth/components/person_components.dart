import 'package:flutter/material.dart';
import 'package:dart_bank/core/widgets/text_label_widgets.dart';

class PersonComponent extends StatefulWidget {
  const PersonComponent({super.key});

  @override
  State<PersonComponent> createState() => _PersonComponentState();
}

class _PersonComponentState extends State<PersonComponent> {
  var nameController = TextEditingController(text: "");
  var birthDateController = TextEditingController(text: "");
  var numberIdController = TextEditingController(text: "");
  var cellController = TextEditingController(text: "");

  DateTime? birthDate;

  String? validateName(String? value) {
    final regex = RegExp(r'^[A-Z][a-z] + ([a-zA-Z]+){1,}$');
    final isValid = regex.hasMatch(value!);
    if (!isValid) return 'Digite o nome completo';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: nameController,
                validator: validateName,
                textlabel: "Nome Completo",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: numberIdController,
                textlabel: "CPF",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: TextLabel(
                controller: cellController,
                textlabel: "Telefone",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: TextLabel(
                  controller: birthDateController,
                  textlabel: "Data de nascimento"),
            ),
            TextField(
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
          ],
        ),
      ),
    );
  }
}
