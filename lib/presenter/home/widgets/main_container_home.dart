import 'package:flutter/material.dart';

import '../../../shared/utils/format_money.dart';
import '../../../shared/utils/get_color_bytheme.dart';
import '../../../shared/utils/is_dark.dart';

class MainContainerHome extends StatelessWidget {
  final int index;
  final String subText;
  final num value;
  late final String entry;
  late final IconData icon;
  late final Color iconColor;
  late final Color textColor;

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
        textColor = Colors.white;

        break;
      case 3:
        entry = "Total";
        icon = Icons.attach_money;
        iconColor = Colors.white;
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
        color: index == 3
            ? isDark(context)
                ? const Color.fromARGB(214, 238, 46, 94)
                : const Color.fromRGBO(238, 46, 93, 1)
            : getColorByTheme(context),
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
                  style: TextStyle(
                    fontSize: 20,
                    color: index == 3 ? Colors.white : Colors.black,
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
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: index == 3 ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              subText,
              style: TextStyle(color: index == 3 ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
