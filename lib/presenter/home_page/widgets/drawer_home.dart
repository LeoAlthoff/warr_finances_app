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
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 210, 52, 105),
            ),
            child: Column(
              children: [
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
          ListTile(
            title: Text('Pesquisa'),
            leading: Icon(Icons.search),
          ),
          ListTile(
            title: Text('Notificações'),
            leading: Icon(Icons.notifications),
          ),
          ListTile(
            title: Text('Contato'),
            leading: Icon(Icons.contact_support_rounded),
          ),
          ListTile(
            title: Text('Segurança'),
            leading: Icon(Icons.shield_outlined),
          ),
          ListTile(
            title: Text('Configurações'),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text('Sair do aplicativo'),
            leading: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
