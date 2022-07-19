import 'package:flutter/material.dart';

import 'icon_circle.dart';

class WrapIconsTwo extends StatelessWidget {
  const WrapIconsTwo({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.cloudy_snowing),
            IconCircle(icon: Icons.deck),
            IconCircle(icon: Icons.diamond_outlined),
            IconCircle(icon: Icons.delete_outline_sharp),
            IconCircle(icon: Icons.delivery_dining_rounded),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.eco_outlined),
            IconCircle(icon: Icons.egg_alt_sharp),
            IconCircle(icon: Icons.email_sharp),
            IconCircle(icon: Icons.factory_rounded),
            IconCircle(icon: Icons.fastfood_outlined),
          ],
        ),
        const SizedBox(height: 60,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.festival_outlined),
            IconCircle(icon: Icons.gavel_outlined),
            IconCircle(icon: Icons.handyman_rounded),
            IconCircle(icon: Icons.headphones_sharp),
            IconCircle(icon: Icons.health_and_safety_rounded),
          ],
        ),
      ],
    );
  }
}