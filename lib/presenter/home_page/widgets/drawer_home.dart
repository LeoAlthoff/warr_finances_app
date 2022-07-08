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
<<<<<<< HEAD
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
=======
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
>>>>>>> 09a012fb608dd7ab5d3a7cea9483b56b3d73da4a
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
<<<<<<< HEAD
          const SizedBox(height: 7),
=======
>>>>>>> 09a012fb608dd7ab5d3a7cea9483b56b3d73da4a
          const ListTile(
            title: Text('Notificações'),
            leading: Icon(Icons.notifications),
          ),
<<<<<<< HEAD
          const SizedBox(height: 7),
=======
>>>>>>> 09a012fb608dd7ab5d3a7cea9483b56b3d73da4a
          const ListTile(
            title: Text('Contato'),
            leading: Icon(Icons.contact_support_rounded),
          ),
<<<<<<< HEAD
          const SizedBox(height: 7),
=======
>>>>>>> 09a012fb608dd7ab5d3a7cea9483b56b3d73da4a
          const ListTile(
            title: Text('Segurança'),
            leading: Icon(Icons.shield_outlined),
          ),
<<<<<<< HEAD
          const SizedBox(height: 7),
=======
>>>>>>> 09a012fb608dd7ab5d3a7cea9483b56b3d73da4a
          const ListTile(
            title: Text('Configurações'),
            leading: Icon(Icons.settings),
          ),
<<<<<<< HEAD
          const SizedBox(height: 7),
=======
>>>>>>> 09a012fb608dd7ab5d3a7cea9483b56b3d73da4a
          const ListTile(
            title: Text('Sair do aplicativo'),
            leading: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
