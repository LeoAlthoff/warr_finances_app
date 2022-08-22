import 'package:flutter/material.dart';

import 'future_all_operations.dart';
import 'future_main_containers.dart';

class BodyHome extends StatefulWidget {
  final Function? callback;
  const BodyHome({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FutureMainContainers(),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Extrato',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FutureAllOperations(widget: widget, mounted: mounted),
        ],
      ),
    );
  }
}
