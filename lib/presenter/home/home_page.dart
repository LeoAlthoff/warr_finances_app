import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/is_dark.dart';
import '../register/register_page.dart';
import '../summary/summary_page.dart';
import 'widgets/body_home.dart';
import 'widgets/drawer_home.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int? id;
  int currentPage;
  final Function? callback;

  HomePage({Key? key, this.currentPage = 0, this.id, this.callback})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser!;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.currentPage);
  }

  void callback() {
    setState(() {
      widget.id = null;
    });
  }

  setCurrentPage(index) {
    setState(
      () {
        widget.currentPage = index;
      },
    );
  }

  Future<String> getTitleAppBar() async {
    switch (widget.currentPage) {
      case 1:
        return 'Cadastro';
      case 2:
        return 'Resumo por categoria';
      default:
        return 'Olá, ${FirebaseAuth.instance.currentUser!.displayName}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      BodyHome(
        callback: callback,
      ),
      RegistrationPage(
        id: widget.id,
      ),
      const Summary(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark(context)
            ? const Color.fromARGB(214, 238, 46, 94)
            : const Color.fromRGBO(238, 46, 93, 1),
        title: FutureBuilder(
          future: getTitleAppBar(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return Text(snapshot.data!);
          },
        ),
        centerTitle: true,
      ),
      drawer: DrawerHome(
        callback: callback,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentPage,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: isDark(context)
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
            icon: Icon(Icons.stacked_bar_chart),
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
