import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'info_chart_summary.dart';

class ItensSummaryPage extends StatelessWidget {
  static Map<String, double> dataMap = {
    'Alimentação': 250,
    'Compras': 1350,
    'Aluguel': 1600,
    'Telefone': 95.55,
    'Contas': 458.9,
  };

  static List<Color> colorList = const [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.purple,
  ];

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
                'Gastos em julho, 2022',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ],
          ),
        ),
        PieChart(
          dataMap: dataMap,
          colorList: colorList,
          chartRadius: MediaQuery.of(context).size.width / 2,
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesOutside: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false,
            chartValueStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
        ),
        const InfoChartSummary(
          icon: Icons.restaurant,
          category: 'Alimentação',
          value: 'R\$ 250,00',
          colorIcon: Colors.red,
        ),
        const InfoChartSummary(
          icon: Icons.shopping_bag,
          category: 'Compras',
          value: 'R\$ 1.350,00',
          colorIcon: Colors.yellow,
        ),
        const InfoChartSummary(
          icon: Icons.house,
          category: 'Aluguel',
          value: 'R\$ 1.600,00',
          colorIcon: Colors.blue,
        ),
        const InfoChartSummary(
          icon: Icons.phone,
          category: 'Telefone',
          value: 'R\$ 95,55',
          colorIcon: Colors.green,
        ),
        const InfoChartSummary(
          icon: Icons.request_page_rounded,
          category: 'Contas',
          value: 'R\$ 458,90',
          colorIcon: Colors.purple,
        ),
      ],
    );
  }
}
