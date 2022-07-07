import 'package:flutter/material.dart';

class InfoChartSummary extends StatelessWidget {
  final IconData icon;
  final String category;
  final String value;
  final Color colorIcon;

  const InfoChartSummary({
    Key? key,
    required this.icon,
    required this.category,
    required this.value,
    required this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                Icon(icon, size: 25, color: colorIcon,),
                SizedBox(width: 20,),
                Text(category, style: TextStyle(fontSize: 18),),
              ]),
            ),
            Text(value, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
