import 'package:flutter/material.dart';
import 'package:flutter_teste_app/shared/utils/shared_preferences.dart';

import '../../../shared/utils/is_dark.dart';
import '../home_page.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  Future<String> getTitleAppBar() async {
    String? userName = SharedPreferencesHelper.prefs!.getString("UserName");
    switch (widget.currentPage) {
      case 1:
        return 'Cadastro';
      case 2:
        return 'Resumo por categoria';
      default:
        return 'Olá, $userName';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
