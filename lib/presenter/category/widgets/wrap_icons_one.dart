import 'package:flutter/material.dart';

import 'icon_circle.dart';

class WrapIconsOne extends StatelessWidget {
  const WrapIconsOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.biotech_sharp),
            IconCircle(icon: Icons.bolt),
            IconCircle(icon: Icons.bookmark),
            IconCircle(icon: Icons.bug_report),
            IconCircle(icon: Icons.border_all_rounded),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.cable),
            IconCircle(icon: Icons.cake),
            IconCircle(icon: Icons.calendar_month_sharp),
            IconCircle(icon: Icons.camera_alt_sharp),
            IconCircle(icon: Icons.color_lens_rounded),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            IconCircle(icon: Icons.child_friendly),
            IconCircle(icon: Icons.chair),
            IconCircle(icon: Icons.checkroom_sharp),
            IconCircle(icon: Icons.coffee),
            IconCircle(icon: Icons.shopping_cart),
          ],
        ),
      ],
    );
  }
}
