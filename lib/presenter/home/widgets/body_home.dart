import 'package:flutter/material.dart';
import 'package:flutter_teste_app/shared/utils/database_helper.dart';
import 'package:flutter_teste_app/shared/utils/format_money.dart';

import 'balance_container.dart';
import 'main_container_home.dart';

class BodyHome extends StatelessWidget {
  BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 5),
              children: [
                MainContainerHome(
                  index: 1,
                  subText: 'Última entrada dia 1º de julho',
                  value: 18000,
                ),
                MainContainerHome(
                  index: 2,
                  subText: 'Última entrada dia 22 de junho',
                  value: 870,
                ),
                MainContainerHome(
                  index: 3,
                  subText: '1º à 31 de julho',
                  value: 17130,
                ),
              ],
            ),
          ),
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
          // FutureBuilder<List<Map<String, dynamic>>>(
          //   future: DatabaseHelper.instance.selectOperation(),
          //   builder:
          //       ((context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          //     if (!snapshot.hasData) {
          //       return const CircularProgressIndicator();
          //     }
          //     return ListView.builder(
          //       padding: const EdgeInsets.all(8),
          //       itemCount: snapshot.data!.length,
          //       itemBuilder: (BuildContext context, int index)  {
          //         // return BalanceContainer(
          //         //   expense:
          //         //       snapshot.data![index]['entry'] == '1' ? true : false,
          //         //   origin: snapshot.data![index]['name'],
          //         //   value: getCurrency(snapshot.data![index]['value']),
          //         //   icon: Icons.attach_money,
          //         //   // Criar map no lugar de uma lista
          //         //   // source: DatabaseHelper.instance
          //         //   //     .getCategory(snapshot.data![index]['categoryId']),
          //         //   time: "01/07/2022",
          //         );
          //       },
          //     );
          //   }),
          // ),
          const BalanceContainer(
            expense: false,
            origin: 'Warren Tecnologia',
            value: '2500.00',
            icon: Icons.attach_money,
            source: 'Salário',
            time: "01/07/2022",
          ),
          const BalanceContainer(
            expense: true,
            origin: 'Ifood',
            value: '250.00',
            icon: Icons.restaurant,
            source: 'Alimentação',
            time: "22/06/2022",
          ),
          const BalanceContainer(
            expense: true,
            origin: 'Angeloni',
            value: '620.00',
            icon: Icons.shopping_bag_outlined,
            source: 'Mercado',
            time: "18/06/2022",
          ),
          const BalanceContainer(
            expense: false,
            origin: 'Professor Ailton',
            value: '15500.00',
            icon: Icons.attach_money,
            source: 'PIX',
            time: "01/07/2022",
          ),
        ],
      ),
    );
  }
}
