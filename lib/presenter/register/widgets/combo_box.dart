import 'package:flutter/material.dart';

import '../../../shared/utils/get_color_bytheme.dart';

class ComboBox extends StatefulWidget {
  const ComboBox({Key? key}) : super(key: key);

  @override
  State<ComboBox> createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  List<String> options = <String>[
    'Selecione um',
    'Alimentação',
    'Compras',
    'Aluguel',
    'Telefone',
    'Contas',
  ];

  String dropDownValue = 'Selecione um';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropDownValue,
          items: options
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropDownValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
