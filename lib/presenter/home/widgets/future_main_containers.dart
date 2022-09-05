import 'package:flutter/material.dart';
import 'package:flutter_teste_app/dio/dio_helper.dart';
import 'package:intl/intl.dart';

import 'main_container_home.dart';

class FutureMainContainers extends StatelessWidget {
  const FutureMainContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectDate = DateTime.now();

    return FutureBuilder(
      future: DioHelper.selectSum(selectDate, 1),
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
                subText:
                    'Última entrada dia ${DateFormat('dd', 'pt_BR').format(snapshot.data['lastEntryPositivo'])} de ${DateFormat('MMMM', 'pt_BR').format(snapshot.data['lastEntryPositivo'])}',
                value: snapshot.data['entry'],
              ),
              MainContainerHome(
                index: 2,
                subText:
                    'Última saída dia ${DateFormat('dd', 'pt_BR').format(snapshot.data['lastEntryNegativo'])} de ${DateFormat('MMMM', 'pt_BR').format(snapshot.data['lastEntryNegativo'])}',
                value: snapshot.data['output'],
              ),
              MainContainerHome(
                index: 3,
                subText:
                    'Mês de ${DateFormat('MMMM', 'pt_BR').format(selectDate)}',
                value: snapshot.data['sum'],
              ),
            ],
          ),
        );
      }),
    );
  }
}
