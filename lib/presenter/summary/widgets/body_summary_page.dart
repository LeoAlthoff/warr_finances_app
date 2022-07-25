import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../shared/utils/database_helper.dart';
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

  late DateTime dateRaw;

  ItensSummaryPage({
    Key? key,
    required this.dateRaw,
  }) : super(key: key);

  @override
  State<ItensSummaryPage> createState() => _ItensSummaryPageState();
}

class _ItensSummaryPageState extends State<ItensSummaryPage> {
  @override
  Widget build(BuildContext context) {
    String dateFormated = DateFormat('MM/yyyy').format(widget.dateRaw);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  widget.dateRaw = DateTime(
                    widget.dateRaw.year,
                    widget.dateRaw.month - 1,
                    widget.dateRaw.day,
                  );
                  dateFormated = DateFormat("MM/yyyy").format(widget.dateRaw);
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
              Text(
                'Saídas: $dateFormated',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.dateRaw = DateTime(
                    widget.dateRaw.year,
                    widget.dateRaw.month + 1,
                    widget.dateRaw.day,
                  );
                  dateFormated = DateFormat("MM/yyyy").format(widget.dateRaw);
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: DatabaseHelper.instance.queryOperation(dateFormated),
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
          future: DatabaseHelper.instance.queryForSummaryChart(dateFormated),
          //future: DatabaseHelper.instance.queryCategoryForSummary('06/2022'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data[0]['name'] == '') {
              return const Center(
                  child: Text('Nenhuma saída cadastrada neste mês!'));
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return InfoChartSummary(
                  icon: IconData(snapshot.data[index]['icon'],
                      fontFamily: 'MaterialIcons'),
                  category: snapshot.data[index]['name'],
                  value: getCurrency(snapshot.data[index]['SUM(o.value)']),
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
