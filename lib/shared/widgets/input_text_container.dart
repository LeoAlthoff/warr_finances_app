import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputContainer extends StatelessWidget {
  final String textValue;
  final TextEditingController? controller;
  TextInputType type;
  bool numericFormatter;

  TextInputContainer({
    Key? key,
    required this.textValue,
    this.type = TextInputType.text,
    this.controller,
    this.numericFormatter = false,
  }) : super(key: key);

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
        vertical: 0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: numericFormatter
            ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]+\.?[0-9]*$'))]
            : [],
        decoration: InputDecoration(
          labelText: textValue,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
