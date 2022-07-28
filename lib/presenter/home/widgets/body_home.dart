import 'package:flutter/material.dart';
import 'package:flutter_teste_app/presenter/register/widgets/body_register.dart';

import '../../../shared/utils/database_helper.dart';
import '../home_page.dart';
import 'balance_container.dart';
import 'main_container_home.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: DatabaseHelper.instance.selectSum(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 5),
                  children: [
                    MainContainerHome(
                      index: 1,
                      subText: 'Última entrada dia 1º de julho',
                      value: snapshot.data['entries'][0]['SUM(value)'],
                    ),
                    MainContainerHome(
                      index: 2,
                      subText: 'Última entrada dia 22 de junho',
                      value: snapshot.data['output'][0]['SUM(value)'],
                    ),
                    MainContainerHome(
                      index: 3,
                      subText: '1º à 31 de julho',
                      value: snapshot.data['total'],
                    ),
                  ],
                ),
              );
            }),
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
          FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
            future: DatabaseHelper.instance.selectContainer(),
            builder: ((context,
                AsyncSnapshot<Map<String, List<Map<String, dynamic>>>>
                    snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!['operation']!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data!['operation'] == null) {
                    return const Center(
                      child: Text('Nenhuma operação cadastrada'),
                    );
                  }
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Alterar informações'),
                            content: const Text('O que você deseja fazer?'),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(238, 46, 93, 1),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(238, 46, 93, 1),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(
                                        currentPage: 1,
                                        id: snapshot.data!['operation']![index]
                                            ['id'],
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Editar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(238, 46, 93, 1),
                                  ),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Você tem certeza'),
                                        content: const Text(
                                            'Deseja deletar esta operação?'),
                                        actions: [
                                          TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    238, 46, 93, 1),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                    currentPage: 0,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Não',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    238, 46, 93, 1),
                                              ),
                                            ),
                                            onPressed: () {
                                              DatabaseHelper.instance
                                                  .deleteOperation(snapshot
                                                          .data!['operation']![
                                                      index]['id']);
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                    currentPage: 0,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Sim',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  'Deletar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: BalanceContainer(
                      expense: snapshot.data!['operation']![index]['entry'] == 1
                          ? false
                          : true,
                      origin: snapshot.data!['operation']![index]['name'],
                      value: snapshot.data!['operation']![index]['value'],
                      icon: IconData(
                          snapshot.data!['category']![snapshot
                                  .data!['operation']![index]['categoryId'] -
                              1]['icon'],
                          fontFamily: 'MaterialIcons'),
                      source: snapshot.data!['category']![
                          snapshot.data!['operation']![index]['categoryId'] -
                              1]['name'],
                      time: snapshot.data!['operation']![index]['date'],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
