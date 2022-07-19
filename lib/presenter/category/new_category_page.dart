import 'package:flutter/material.dart';

import 'widgets/new_category_body.dart';



class NewCategoryPage extends StatelessWidget {
  const NewCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewCategoryBody(),
    );
  }
}