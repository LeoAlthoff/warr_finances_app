import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import '../../home/home_page.dart';
import 'input_widget_login_page.dart';
import 'login_page.dart';

class BodyLoginPage extends StatefulWidget {
  BodyLoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  State<BodyLoginPage> createState() => _BodyLoginPageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _BodyLoginPageState extends State<BodyLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 150,
                child: Lottie.asset(
                  'assets/lottie/pig2.json',
                ),
              ),
              Column(
                children: const [
                  Text(
                    'Warr Finances',
                    style:
                        TextStyle(fontSize: 30, color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Entrar na sua conta',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              InputWidget(
                autoFocus: false,
                focusNode: emailNode,
                controller: emailController,
                icon: Icons.email,
                isPassword: false,
                labelTextInput: 'Email',
              ),
              InputWidget(
                autoFocus: false,
                focusNode: passwordNode,
                controller: passwordController,
                icon: Icons.lock,
                isPassword: true,
                labelTextInput: 'Senha',
              ),
              TextButton(
                onPressed: () {
                  navigateToResetPassword(context);
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(height: 5),
              SignInButton(
                Buttons.Email,
                onPressed: () async {
                  // /*
                  try {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    UserCredential result =
                        await auth.signInWithEmailAndPassword(email: email, password: password);
                    User? user = result.user;
                    nagigateToHomeScreen(context, user!);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Usuário inexistente!'),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(238, 46, 93, 1)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    } else if (e.code == 'wrong-password') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Senha Incorreta!'),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(238, 46, 93, 1)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    } else if (e.code == 'invalid-email') {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('E-mail inválido!'),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(238, 46, 93, 1)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                    print(e.code);
                  }
                },
                text: 'Entrar com E-mail',
              ),
              SignInButton(
                Buttons.Google,
                text: 'Entrar com Google',
                onPressed: () async {
                  User? user = await signInWithGoogle();
                  if (user != null) {
                    print(user);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          user: user,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  navigateToSignUpPage(context);
                },
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<User?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  if (googleAuth != null) {
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredentials = await auth.signInWithCredential(credential);
    return userCredentials.user;
  }
  return null;
}
