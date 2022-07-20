import 'package:flutter/material.dart';
import 'package:flutter_teste_app/presenter/login/widgets/login_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreenLoginPage extends StatefulWidget {

  const SplashScreenLoginPage({ Key? key }) : super(key: key);

  @override
  State<SplashScreenLoginPage> createState() => _SplashScreenLoginPageState();
}

class _SplashScreenLoginPageState extends State<SplashScreenLoginPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return  LoginPage();
        }),
      );
    });
    super.initState();
  }
  Widget build(BuildContext context) {
      return Container(
        color: Color.fromARGB(255, 234, 198, 214),
          child: Lottie.asset('assets/lottie/cifrao_rosa.json',),
      );
  }
}