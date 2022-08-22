import 'package:flutter/material.dart';

import '../../../shared/utils/is_dark.dart';
import '../home_page.dart';

class BottomNavigationHome extends StatelessWidget {
  final PageController pageController;
  const BottomNavigationHome({
    Key? key,
    required this.widget,
    required this.pageController,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentPage,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      selectedItemColor: isDark(context)
          ? const Color.fromARGB(214, 238, 46, 94)
          : const Color.fromRGBO(238, 46, 93, 1),
      showUnselectedLabels: false,
      onTap: (index) {
        widget.currentPage = index;
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
    );
  }
}
