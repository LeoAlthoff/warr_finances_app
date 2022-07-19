import 'package:flutter/material.dart';

import 'icon_circle.dart';

class WrapIcons extends StatelessWidget {
  const WrapIcons({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.restaurant_menu),
            IconCircle(icon: Icons.monetization_on),
            IconCircle(icon: Icons.request_page),
            IconCircle(icon: Icons.celebration),
            IconCircle(icon: Icons.signal_cellular_alt_sharp),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.ac_unit),
            IconCircle(icon: Icons.access_alarm_outlined),
            IconCircle(icon: Icons.account_balance),
            IconCircle(icon: Icons.agriculture),
            IconCircle(icon: Icons.backpack_outlined),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.badge),
            IconCircle(icon: Icons.bakery_dining),
            IconCircle(icon: Icons.beach_access),
            IconCircle(icon: Icons.bed),
            IconCircle(icon: Icons.landscape),
          ],
        ),
      ],
    );
  }
}