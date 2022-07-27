import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../shared/utils/database_helper.dart';
import '../../../shared/utils/format_money.dart';
import '../../../shared/utils/is_dark.dart';
import 'info_chart_summary.dart';

class ItensSummaryPage extends StatefulWidget {
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
            vertical: 15,
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
                child: Icon(
                  Icons.arrow_back_ios,
                  color: isDark(context)
                      ? const Color.fromARGB(214, 238, 46, 94)
                      : const Color.fromRGBO(238, 46, 93, 1),
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
          future: Future.wait([
            DatabaseHelper.instance.queryOperation(dateFormated),
            DatabaseHelper.instance.getColorsCategory(dateFormated)
          ]),
          builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            if (snapshot.data![0].isEmpty) {
              return const Center(
                  child: Center(
                child: Text(
                  'Nenhuma saída cadastrada neste mês.',
                  style: TextStyle(fontSize: 18),
                ),
              ));
            }
            return PieChart(
              dataMap: snapshot.data![0],
              colorList: snapshot.data![1],
              chartRadius: MediaQuery.of(context).size.width / 2,
              chartValuesOptions: ChartValuesOptions(
                showChartValuesOutside: true,
                showChartValuesInPercentage: true,
                showChartValueBackground: false,
                chartValueStyle: TextStyle(
                  color: isDark(context) ? Colors.white : Colors.black,
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
          future: DatabaseHelper.instance.queryForSummaryChart(dateFormated),
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
                  icon: IconData(snapshot.data[index]['icon'],
                      fontFamily: 'MaterialIcons'),
                  category: snapshot.data[index]['name'],
                  value: getCurrency(snapshot.data[index]['SUM(o.value)']),
                  colorIcon: Color(snapshot.data[index]['color']),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
