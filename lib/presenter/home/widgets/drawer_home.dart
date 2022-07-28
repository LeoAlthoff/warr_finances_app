import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../shared/utils/database_helper.dart';
import '../../../shared/utils/is_dark.dart';
import '../../category/new_category_page.dart';
import '../../login/widgets/login_page.dart';
import '../home_page.dart';
import '../test_page.dart';

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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NewCategoryPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Apagar todas as operações'),
            leading: const Icon(Icons.delete_forever),
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                      'Essa ação deletará todas as operações registradas.'),
                  content: const Text('Você tem certeza que quer excluí-las?'),
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
                        'Não',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(238, 46, 93, 1)),
                      ),
                      onPressed: () async {
                        DatabaseHelper.instance.deleteAllOperations();
                        callback;
                        Navigator.of(context).pop();
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage(currentPage: 0);
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Sim',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
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
