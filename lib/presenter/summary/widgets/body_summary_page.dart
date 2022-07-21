import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_teste_app/shared/utils/database_helper.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../shared/utils/format_money.dart';
import 'info_chart_summary.dart';

class ItensSummaryPage extends StatefulWidget {
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
  State<ItensSummaryPage> createState() => _ItensSummaryPageState();
}

class _ItensSummaryPageState extends State<ItensSummaryPage> {
  Map<String, double> dataMap = {
    'Alimentação': 250,
    'Compras': 1350,
    'Aluguel': 1600,
    'Telefone': 95.55,
    'Contas': 458.9,
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 15,
          ),
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
        FutureBuilder(
          future: DatabaseHelper.instance.queryOperation('06/2022'),
          builder: ((context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return PieChart(
              dataMap: snapshot.data,
              colorList: ItensSummaryPage.colorList,
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
            );
          }),
        ),
        const SizedBox(
          height: 15,
        ),
        FutureBuilder(
          future: DatabaseHelper.instance.queryCategoryForSummary('06/2022'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                if (snapshot.data! == null) {
                  return const Center(
                    child: Text('Nenhuma operação cadastrada neste mês'),
                  );
                }
                return InfoChartSummary(
                  icon: IconData(snapshot.data[index]['icon']),
                  category: snapshot.data[index]['name'],
                  value: getCurrency(snapshot.data[index]['sum']),
                  colorIcon: Color(int.parse(snapshot.data[index]['color'])),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
