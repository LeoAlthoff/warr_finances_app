import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../shared/utils/is_dark.dart';
import '../../../theme.dart';
import '../../category/new_category_page.dart';
import '../../login/widgets/login_page.dart';
import '../test_page.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 130,
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
                          )),
                      const SizedBox(width: 10),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Rodrigo',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '          rodrigo@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ),
          const ListTile(
            title: Text('Pesquisa'),
            leading: Icon(Icons.search),
          ),
          const SizedBox(height: 7),
          const ListTile(
            title: Text('Notificações'),
            leading: Icon(Icons.notifications),
          ),
          const SizedBox(height: 7),
          const ListTile(
            title: Text('Contato'),
            leading: Icon(Icons.contact_support_rounded),
          ),
          const SizedBox(height: 7),
          ListTile(
            title: const Text('Segurança'),
            leading: const Icon(Icons.shield_outlined),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NewCategoryPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 7),
          ListTile(
            title: const Text('Teste Dev'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TestPage(),
                ),
              );
            },
          ),
          const ListTile(
            title: Text('Configurações'),
            leading: Icon(Icons.settings),
          ),
          const SizedBox(height: 7),
          const Divider(
            height: 1,
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
              Navigator.of(context).push(
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
