import 'package:flutter/material.dart';
import 'package:flutter_teste_app/theme.dart';

import '../register/register_page.dart';
import '../summary/summary_page.dart';
import 'widgets/body_home.dart';
import 'widgets/drawer_home.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int currentPage;
  HomePage({Key? key, this.currentPage = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  final screens = const [
    BodyHome(),
    RegistrationPage(),
    Summary(),
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.currentPage);
  }

  setCurrentPage(index) {
    setState(
      () {
        widget.currentPage = index;
      },
    );
  }

  String getTitleAppBar() {
    switch (widget.currentPage) {
      case 1:
        return 'Cadastro';
      case 2:
        return 'Resumo por categoria';
      default:
        return 'Olá, Rodrigo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.isDark
            ? const Color.fromARGB(214, 238, 46, 94)
            : const Color.fromRGBO(238, 46, 93, 1),
        title: Text(getTitleAppBar()),
        centerTitle: true,
      ),
      drawer: const DrawerHome(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentPage,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: MyTheme.isDark
            ? const Color.fromARGB(214, 238, 46, 94)
            : const Color.fromRGBO(238, 46, 93, 1),
        showUnselectedLabels: false,
        onTap: (index) {
          setCurrentPage(index);
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.drag_handle_sharp),
            label: "Extrato",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Cadastro",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: "Resumo",
          ),
        ],
      ),
      body: PageView(
        onPageChanged: setCurrentPage,
        controller: pageController,
        children: screens,
      ),
    );
  }
}
