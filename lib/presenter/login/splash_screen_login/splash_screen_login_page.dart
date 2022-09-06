import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/utils/shared_preferences.dart';
import '../../home/home_page.dart';
import '../widgets/login_page.dart';

class SplashScreenLoginPage extends StatefulWidget {
  const SplashScreenLoginPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenLoginPage> createState() => _SplashScreenLoginPageState();
}

class _SplashScreenLoginPageState extends State<SplashScreenLoginPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              if (SharedPreferencesHelper.prefs?.getString("UserName") !=
                      null &&
                  SharedPreferencesHelper.prefs?.getString("UserName") != "") {
                return HomePage();
              } else {
                return const LoginPage();
              }
            },
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(238, 46, 93, 1),
            Color.fromARGB(255, 238, 135, 161),
          ],
        ),
      ),
      child: Lottie.asset(
        'assets/lottie/cifrao_rosa.json',
      ),
    );
  }
}
