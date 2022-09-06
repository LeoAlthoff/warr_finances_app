import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../shared/utils/is_dark.dart';
import '../../../shared/utils/shared_preferences.dart';
import '../../login/widgets/login_page.dart';
import '../../pdf/pdf_page.dart';

class DrawerHome extends StatelessWidget {
  final Function? callback;

  const DrawerHome({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 147,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: isDark(context)
                    ? const Color.fromARGB(214, 238, 46, 94)
                    : const Color.fromRGBO(238, 46, 93, 1),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: isDark(context)
                              ? const Color.fromARGB(214, 238, 46, 94)
                              : const Color.fromRGBO(238, 46, 93, 1),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        SharedPreferencesHelper.prefs!.getString("UserName")!,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    SharedPreferencesHelper.prefs!.getString("UserEmail")!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'O que deseja fazer ?',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 7),
          const SizedBox(height: 7),
          const Divider(
            height: 1,
          ),
          ListTile(
            title: const Text('Gerar pdf'),
            leading: const Icon(Icons.picture_as_pdf_rounded),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ShowPdf('Extrato')));
            },
          ),
          ListTile(
            title: const Text('Dark Theme'),
            leading: const Icon(Icons.dark_mode),
            onTap: () {
              currentTheme.switchTheme();
            },
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            title: const Text('Sair da conta'),
            leading: const Icon(Icons.arrow_back),
            onTap: () {
              logOutFromAccount();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

logOutFromAccount() {
  SharedPreferencesHelper.prefs!.setString("UserName", "");
  SharedPreferencesHelper.prefs!.setString("UserName", "");
}
