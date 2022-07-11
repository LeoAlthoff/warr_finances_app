import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool income;
  final String textValue;

  const CustomButton({
    Key? key,
    required this.income,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade500,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            income
                ? const Icon(
                    Icons.arrow_circle_up,
                    size: 30,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.arrow_circle_down,
                    size: 30,
                    color: Colors.red,
                  ),
            const SizedBox(
              width: 10,
            ),
            Text(
              textValue,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
