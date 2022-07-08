import 'package:flutter/material.dart';

class ComboBox extends StatelessWidget {
  const ComboBox({
    Key? key,
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          items: [
            DropdownMenuItem(
              child: Text(
                'Selecione',
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
          onChanged: (context) {},
          style: const TextStyle(),
        ),
      ),
    );
  }
}
