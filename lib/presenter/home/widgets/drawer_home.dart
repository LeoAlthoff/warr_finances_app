import 'package:flutter/material.dart';
import 'package:flutter_teste_app/config.dart';
import 'package:flutter_teste_app/presenter/login/login_page.dart';

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
              decoration: const BoxDecoration(
                color: Color.fromRGBO(238, 46, 93, 1),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Color.fromRGBO(238, 46, 93, 1),
                          size: 20,
                        ),
                        radius: 10,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Align(
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
          const ListTile(
            title: Text('Segurança'),
            leading: Icon(Icons.shield_outlined),
          ),
          const SizedBox(height: 7),
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
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
