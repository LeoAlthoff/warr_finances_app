import 'package:flutter/material.dart';

import '../../../shared/utils/database_helper.dart';
import 'main_container_home.dart';

class FutureMainContainers extends StatelessWidget {
  const FutureMainContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseHelper.instance.selectSum(),
      builder: ((context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 5),
            children: [
              MainContainerHome(
                index: 1,
                subText: 'Última entrada dia 1º de julho',
                value: snapshot.data['entries'][0]['SUM(value)'],
              ),
              MainContainerHome(
                index: 2,
                subText: 'Última entrada dia 22 de junho',
                value: snapshot.data['output'][0]['SUM(value)'],
              ),
              MainContainerHome(
                index: 3,
                subText: '1º à 31 de julho',
                value: snapshot.data['total'],
              ),
            ],
          ),
        );
      }),
    );
  }
}
