import 'package:flutter/material.dart';

import 'MainContainerHome.dart';
import 'othher_container.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MainContainerHome(),
          const SizedBox(height: 15),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Extrato',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const OtherContainer(
            expense: false,
            origin: 'Warren Tecnologia',
            value: 2500,
            icon: Icons.attach_money,
            source: 'Salário',
            time: "01/07/2022",
          ),
          const OtherContainer(
            expense: true,
            origin: 'Ifood',
            value: 250,
            icon: Icons.restaurant,
            source: 'Alimentação',
            time: "22/06/2022",
          ),
          const OtherContainer(
            expense: true,
            origin: 'Angeloni',
            value: 620,
            icon: Icons.shopping_bag_outlined,
            source: 'Mercado',
            time: "18/06/2022",
          ),
          const OtherContainer(
            expense: false,
            origin: 'Professor Ailton',
            value: 15500,
            icon: Icons.attach_money,
            source: 'PIX',
            time: "01/07/2022",
          ),
        ],
      ),
    );
  }
}
