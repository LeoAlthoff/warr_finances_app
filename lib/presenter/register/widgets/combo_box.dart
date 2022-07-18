import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  String dropDownValue;
  ComboBox({
    Key? key,
    required this.dropDownValue,
  }) : super(key: key);

  get getDropdownValue {
    return dropDownValue;
  }

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      // child: DropdownButtonHideUnderline(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.dropDownValue,
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
              widget.dropDownValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
