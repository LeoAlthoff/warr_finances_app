import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/utils/is_dark.dart';
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
  DateTime dateRaw = DateTime.now();
  String dateFormated = DateFormat("yyyy/MM").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  dateRaw = DateTime(
                    dateRaw.year,
                    dateRaw.month - 1,
                    dateRaw.day,
                  );
                  dateFormated = DateFormat("yyyy/MM").format(dateRaw);
                  setState(() {});
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: isDark(context)
                      ? const Color.fromARGB(214, 238, 46, 94)
                      : const Color.fromRGBO(238, 46, 93, 1),
                  size: 20,
                ),
              ),
              Text(
                'Extrato de $dateFormated',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {
                  dateRaw = DateTime(
                    dateRaw.year,
                    dateRaw.month + 1,
                    dateRaw.day,
                  );
                  dateFormated = DateFormat("yyyy/MM").format(dateRaw);
                  setState(() {});
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: isDark(context)
                      ? const Color.fromARGB(214, 238, 46, 94)
                      : const Color.fromRGBO(238, 46, 93, 1),
                  size: 20,
                ),
              ),
            ],
          ),
          FutureMainContainers(dateRaw: dateRaw),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Operações',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FutureAllOperations(
            dateRaw: dateRaw,
            widget: widget,
            mounted: mounted,
          ),
        ],
      ),
    );
  }
}
