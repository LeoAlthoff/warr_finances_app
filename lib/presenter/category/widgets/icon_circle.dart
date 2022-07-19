import 'package:flutter/material.dart';

class IconCircle extends StatelessWidget {
  final IconData icon;
  const IconCircle({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blueGrey.shade100,
      radius: 25,
      child: TextButton(
        onPressed: () {},
        child: Icon(
          icon,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}
