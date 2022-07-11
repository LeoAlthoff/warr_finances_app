import 'package:flutter/material.dart';
import 'main_container_home.dart';
import 'other_container.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 5),
              children: [
                Row(
                  children: [
                    MainContainerHome(index: 1, value: 18000),
                    MainContainerHome(index: 2, value: 870),
                    MainContainerHome(index: 3, value: 17130),
                  ],
                ),
              ],
            ),
          ),
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
            value: 2500.00,
            icon: Icons.attach_money,
            source: 'Salário',
            time: "01/07/2022",
          ),
          const OtherContainer(
            expense: true,
            origin: 'Ifood',
            value: 250.00,
            icon: Icons.restaurant,
            source: 'Alimentação',
            time: "22/06/2022",
          ),
          const OtherContainer(
            expense: true,
            origin: 'Angeloni',
            value: 620.00,
            icon: Icons.shopping_bag_outlined,
            source: 'Mercado',
            time: "18/06/2022",
          ),
          const OtherContainer(
            expense: false,
            origin: 'Professor Ailton',
            value: 15500.00,
            icon: Icons.attach_money,
            source: 'PIX',
            time: "01/07/2022",
          ),
        ],
      ),
    );
  }
}
