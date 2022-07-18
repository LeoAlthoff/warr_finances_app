import 'package:flutter/material.dart';
import '../../home/home_page.dart';
import 'buttons_login_page.dart';
import 'card_header_login_page.dart';


class BodyLoginPage extends StatelessWidget {
  const BodyLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: const [
            CardHeaderLogin(),
            SizedBox(height: 20),
            ButtonsLogin(),
          ]),
        ),
      ),
    );
  }
}

void nagigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const HomePage()));
}