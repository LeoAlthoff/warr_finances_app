import 'package:flutter/material.dart';

class MainContainerHome extends StatelessWidget {
  const MainContainerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 150,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Entradas',
                  style: TextStyle(fontSize: 20),
                ),
                Icon(
                  Icons.arrow_circle_up,
                  size: 35,
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'R\$ 18.000,00',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            const Text('Última entrada dia 1º de julho'),
          ],
        ),
      ),
    );
  }
}
