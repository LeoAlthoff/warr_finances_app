import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 210, 52, 105),
            ),
            child: Column(
              children: const [
                Text(
                  'Rodrigo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  ),
                Text(
                  'rodrigo@gmail.com',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  ),
                Text(
                  'O que deseja fazer ?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            title: Text('Pesquisa'),
            leading: Icon(Icons.search),
          ),
          const ListTile(
            title: Text('Notificações'),
            leading: Icon(Icons.notifications),
          ),
          const ListTile(
            title: Text('Contato'),
            leading: Icon(Icons.contact_support_rounded),
          ),
          const ListTile(
            title: Text('Segurança'),
            leading: Icon(Icons.shield_outlined),
          ),
          const ListTile(
            title: Text('Configurações'),
            leading: Icon(Icons.settings),
          ),
          const ListTile(
            title: Text('Sair do aplicativo'),
            leading: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
