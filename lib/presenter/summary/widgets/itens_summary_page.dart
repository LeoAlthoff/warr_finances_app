import 'package:flutter/material.dart';
import '../../../shared/utils/format_money.dart';
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
                'Saídas: julho, 2022',
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
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InfoChartSummary(
          icon: Icons.restaurant,
          category: 'Alimentação',
          value: getCurrency(dataMap['Alimentação']),
          colorIcon: colorList[0],
        ),
        InfoChartSummary(
          icon: Icons.shopping_bag,
          category: 'Compras',
          value: getCurrency(dataMap['Compras']),
          colorIcon: colorList[1],
        ),
        InfoChartSummary(
          icon: Icons.house,
          category: 'Aluguel',
          value: getCurrency(dataMap['Aluguel']),
          colorIcon: colorList[2],
        ),
        InfoChartSummary(
          icon: Icons.phone,
          category: 'Telefone',
          value: getCurrency(dataMap['Telefone']),
          colorIcon: colorList[3],
        ),
        InfoChartSummary(
          icon: Icons.request_page_rounded,
          category: 'Contas',
          value: getCurrency(dataMap['Contas']),
          colorIcon: colorList[4],
        ),
      ],
    );
  }
}
