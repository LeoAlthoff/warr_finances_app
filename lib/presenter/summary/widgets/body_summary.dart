import 'package:flutter/material.dart';
import 'package:flutter_teste_app/dio/dio_helper.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../shared/utils/format_money.dart';
import '../../../shared/utils/is_dark.dart';
import 'info_chart_summary.dart';

class BodySummary extends StatefulWidget {
  const BodySummary({
    Key? key,
  }) : super(key: key);

  @override
  State<BodySummary> createState() => _BodySummaryState();
}

class _BodySummaryState extends State<BodySummary> {
  DateTime dateRaw = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String dateFormated = DateFormat("yyyy/MM").format(dateRaw);
    String dateShow = DateFormat("MM/yyyy").format(dateRaw);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  dateRaw = DateTime(
                    dateRaw.year,
                    dateRaw.month - 1,
                    dateRaw.day,
                  );
                  dateFormated = DateFormat("yyyy/MM").format(dateRaw);
                  setState(() {});
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: isDark(context)
                      ? const Color.fromARGB(214, 238, 46, 94)
                      : const Color.fromRGBO(238, 46, 93, 1),
                  size: 20,
                ),
              ),
              Text(
                'Saídas: $dateShow',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {
                  dateRaw = DateTime(
                    dateRaw.year,
                    dateRaw.month + 1,
                    dateRaw.day,
                  );
                  dateFormated = DateFormat("yyyy/MM").format(dateRaw);
                  setState(() {});
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: isDark(context)
                      ? const Color.fromARGB(214, 238, 46, 94)
                      : const Color.fromRGBO(238, 46, 93, 1),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: DioHelper.getOperations(dateRaw, 1),

          // DatabaseHelper.instance.queryOperation(dateFormated),
          // DatabaseHelper.instance.getColorsCategory(dateFormated)
          builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            if (snapshot.data![2][0].isEmpty) {
              return const Center(
                child: Center(
                  child: Text(
                    'Nenhuma saída cadastrada neste mês.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }
            return PieChart(
              dataMap: snapshot.data![2][0],
              colorList: snapshot.data![2][1],
              chartRadius: MediaQuery.of(context).size.width / 2,
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValueBackground: false,
                chartValueStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
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
          //TODO: Implement dio (API)
          future: DioHelper.getOperations(dateRaw, 1),
          // future: DatabaseHelper.instance.queryForSummaryChart(dateFormated),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data.isEmpty) {
              return Center(
                  child: Lottie.asset('assets/lottie/not_found.json'));
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
                  icon: IconData(
                    snapshot.data[2][index]['icon'],
                    fontFamily: 'MaterialIcons',
                  ),
                  category: snapshot.data[2][index]['name'],
                  value: getCurrency(
                    snapshot.data[2][index]['SUM(o.value)'],
                  ),
                  colorIcon: Color(
                    snapshot.data[2][index]['color'],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  //  double getCategorySum(Future<List<OperationModel>> getOperations ) {

  //   for (var i = 0; i < ; i++) {

  //   }
  //   return getOperations.map();
  // }
}
