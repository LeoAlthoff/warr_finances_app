import 'package:flutter/material.dart';

class TextInputContainer extends StatelessWidget {
  final String textValue;

  const TextInputContainer({
    Key? key,
    required this.textValue,
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
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: textValue,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
