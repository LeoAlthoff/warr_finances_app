import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/new_category_body.dart';

class NewCategoryPage extends StatelessWidget {
  final User user;
  const NewCategoryPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 46, 93, 1),
        centerTitle: true,
        title: const Text('Criar nova categoria'),
      ),
      body: NewCategoryBody(user: user),
    );
  }
}
