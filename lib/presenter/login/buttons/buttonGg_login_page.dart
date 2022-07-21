import 'package:flutter/material.dart';

class ButtonGgBodyLogin extends StatelessWidget {
  const ButtonGgBodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Login com Google',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google2.png'),
                  ),
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
