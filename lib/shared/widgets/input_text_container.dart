import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/is_dark.dart';

class TextInputContainer extends StatelessWidget {
  final String textValue;
  final TextEditingController? controller;
  final TextInputType type;
  final bool autoFocus;
  final FocusNode? nextFocus;
  final FocusNode? focusNode;
  final bool numericFormatter;

  const TextInputContainer({
    Key? key,
    required this.textValue,
    this.controller,
    this.type = TextInputType.text,
    this.autoFocus = false,
    this.nextFocus,
    this.focusNode,
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
      child: TextFormField(
        focusNode: focusNode,
        autofocus: autoFocus,
        onFieldSubmitted: (value) {
          if (nextFocus != null) {
            nextFocus!.requestFocus();
          }
        },
        controller: controller,
        cursorColor: isDark(context) ? Colors.white38 : Colors.black38,
        validator: (value) =>
            int.parse(value!).isNaN ? 'Valor ínvalido!' : null,
        inputFormatters: numericFormatter
            ? [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]+\.?[0-9]*$')),
              ]
            : [],
        keyboardType:
            numericFormatter ? TextInputType.number : TextInputType.name,
        decoration: InputDecoration(
          labelText: textValue,
          labelStyle: TextStyle(color: Theme.of(context).hintColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDark(context) ? Colors.white38 : Colors.black38,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDark(context) ? Colors.white38 : Colors.black38,
              width: 1,
            ),
          ),
          focusColor: isDark(context)
              ? const Color.fromARGB(214, 238, 46, 94)
              : const Color.fromRGBO(238, 46, 93, 1),
        ),
      ),
    );
  }
}
