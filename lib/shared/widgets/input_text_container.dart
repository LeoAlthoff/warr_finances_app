import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/is_dark.dart';

class TextInputContainer extends StatelessWidget {
  final String textValue;
  final TextEditingController? controller;
  final TextInputType type;
  final bool numericFormatter;

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
        horizontal: 18,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        cursorColor: isDark(context) ? Colors.white38 : Colors.black38,
        inputFormatters: numericFormatter
            ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]+\.?[0-9]*$'))]
            : [],
        decoration: InputDecoration(
          labelText: textValue,
          labelStyle: TextStyle(color: Theme.of(context).hintColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isDark(context) ? Colors.white38 : Colors.black38),
          ),
          focusColor: isDark(context)
              ? const Color.fromARGB(214, 238, 46, 94)
              : const Color.fromRGBO(238, 46, 93, 1),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDark(context) ? Colors.white38 : Colors.black38,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
