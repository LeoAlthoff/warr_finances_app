import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String labelTextInput;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;

  const InputWidget({
    Key? key,
    required this.labelTextInput,
    required this.icon,
    required this.controller,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      child: TextField(
        obscureText: isPassword,
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          labelText: labelTextInput,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
