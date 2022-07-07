import 'package:flutter/material.dart';

import 'info_chart_summary.dart';

class ItensSummaryPage extends StatelessWidget {
  const ItensSummaryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              Text(
                'julho, 2022',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ],
          ),
        ),
        Image.network(
            'https://www.w3schools.com/python/img_matplotlib_pie1.png'),
        const InfoChartSummary(
          icon: Icons.restaurant,
          category: 'Alimentação',
          value: 'R\$ 2.500,00',
          colorIcon: Colors.blue,
        ),
        const InfoChartSummary(
          icon: Icons.shopping_bag,
          category: 'Compras',
          value: 'R\$ 1.350,00',
          colorIcon: Colors.orange,
        ),
        const InfoChartSummary(
          icon: Icons.phone,
          category: 'Telefone',
          value: 'R\$ 95,00',
          colorIcon: Colors.red,
        ),
        const InfoChartSummary(
          icon: Icons.money,
          category: 'Salário',
          value: 'R\$ 1.500,00',
          colorIcon: Colors.green,
        )
      ],
    );
  }
}
