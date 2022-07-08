import 'package:flutter/material.dart';

import 'widgets/body_home.dart';
import 'widgets/drawer_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pc;
  final screens = [
    //TODO colocar as páginas a acessar
    //pag home
    //pag cadastrar
    //pag resumo
  ];
  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setCurrentPage(index) {
    setState(
      () {
        currentPage = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 52, 105),
        title: const Text('Olá, Rodrigo'),
        centerTitle: true,
      ),
      drawer: const DrawerHome(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        onTap: (index) {
          pc.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.drag_handle_sharp),
            label: "Extrato",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Cadastrar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: "Resumo",
          ),
        ],
      ),
      body: PageView(
        controller: pc,
        onPageChanged: setCurrentPage,
        children: const [
          BodyHome(), //página 1
          BodyHome(), //página 2
          BodyHome(), //página 3
        ],
      ),
    );
  }
}
