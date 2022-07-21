import 'package:flutter/material.dart';

class ButtonFbLoginPage extends StatelessWidget {
  const ButtonFbLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade700,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue.shade700,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Login com Facebook',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fb.png'),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
