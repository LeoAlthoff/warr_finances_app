import 'package:flutter/material.dart';

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
                color: Color.fromARGB(255, 210, 52, 105),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 26,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Rodrigo',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
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
                      '        rodrigo@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.bottomLeft,
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
          const ListTile(
            title: Text('Sair do aplicativo'),
            leading: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
