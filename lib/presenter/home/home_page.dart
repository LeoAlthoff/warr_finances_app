import 'package:flutter/material.dart';

import '../../dio/model/operation_model.dart';
import '../register/register_page.dart';
import '../summary/summary_page.dart';
import 'widgets/appbar_home.dart';
import 'widgets/body_home.dart';
import 'widgets/bottom_navigation_home.dart';
import 'widgets/drawer_home.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  OperationModel? operation;
  int currentPage;
  final Function? callback;

  HomePage({
    Key? key,
    this.operation,
    this.currentPage = 0,
    this.callback,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.currentPage);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      BodyHome(callback: callback),
      RegistrationPage(operation: widget.operation),
      const Summary(),
    ];
    return Scaffold(
      appBar: AppBarHome(widget: widget),
      drawer: DrawerHome(
        callback: callback,
      ),
      bottomNavigationBar: BottomNavigationHome(
        widget: widget,
        pageController: pageController,
      ),
      body: PageView(
        onPageChanged: setCurrentPage,
        controller: pageController,
        children: screens,
      ),
    );
  }

  void callback() {
    setState(() {
      widget.operation = null;
    });
  }

  setCurrentPage(index) {
    setState(
      () {
        widget.currentPage = index;
      },
    );
  }
}
