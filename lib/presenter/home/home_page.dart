import 'package:flutter/material.dart';
import '../register/register_page.dart';
import '../summary/summary_page.dart';
import 'widgets/body_home.dart';
import 'widgets/drawer_home.dart';

class HomePage extends StatefulWidget {
  int currentPage;
  HomePage({Key? key, this.currentPage = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  final screens = [
    BodyHome(),
    const RegistrationPage(),
    const Summary(),
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
        backgroundColor: const Color.fromRGBO(238, 46, 93, 1),
        title: Text(getTitleAppBar()),
        centerTitle: true,
      ),
      drawer: const DrawerHome(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentPage,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
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
            label: "Cadastrar",
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
