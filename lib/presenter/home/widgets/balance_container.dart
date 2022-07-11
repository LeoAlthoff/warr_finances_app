import 'package:flutter/material.dart';

import '../../../shared/utils/format_money.dart';

class BalanceContainer extends StatelessWidget {
  final bool expense;
  final String origin;
  final double value;
  final IconData icon;
  final String source;
  final String time;

  const BalanceContainer({
    Key? key,
    required this.expense,
    required this.origin,
    required this.value,
    required this.icon,
    required this.source,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 5,
            color: Colors.grey.shade200,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              origin,
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 10),
            Text(
              // getCurrency(value).toString(),
              expense ? '- ${getCurrency(value)}' : getCurrency(value),
              style: TextStyle(
                fontSize: 27,
                color: expense ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 23),
                    const SizedBox(width: 10),
                    Text(
                      source,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
