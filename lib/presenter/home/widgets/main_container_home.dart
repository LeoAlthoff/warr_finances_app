import 'package:flutter/material.dart';

import '../../../shared/utils/format_money.dart';
import '../../../shared/utils/get_color_bytheme.dart';

class MainContainerHome extends StatelessWidget {
  final int index;
  final String subText;
  final num value;
  late final String entry;
  late final IconData icon;
  late final Color iconColor;
  late final Color textColor;
  late final Color background;

  // ignore: prefer_const_constructors_in_immutables
  MainContainerHome({
    Key? key,
    required this.index,
    required this.subText,
    required this.value,
  }) : super(key: key) {
    defineContainer(index);
  }

  void defineContainer(entrada) {
    switch (index) {
      case 1:
        entry = "Entradas";
        icon = Icons.arrow_circle_up;
        iconColor = Colors.green;

        break;
      case 2:
        entry = "Saídas";
        icon = Icons.arrow_circle_down;
        iconColor = Colors.red;
        textColor = Colors.black;
        background = Colors.white;
        break;
      case 3:
        entry = "Total";
        icon = Icons.attach_money;
        iconColor = Colors.white;

        background = const Color.fromARGB(255, 233, 70, 124);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: getColorByTheme(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(
                  icon,
                  size: 35,
                  color: iconColor,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              getCurrency(value),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subText,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
