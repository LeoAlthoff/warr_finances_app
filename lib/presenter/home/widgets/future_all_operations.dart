import 'package:flutter/material.dart';
import 'package:flutter_teste_app/dio/dio_helper.dart';

import '../../../shared/utils/date_formater.dart';
import '../home_page.dart';
import 'balance_container.dart';
import 'body_home.dart';

class FutureAllOperations extends StatelessWidget {
  const FutureAllOperations({
    Key? key,
    required this.widget,
    required this.mounted,
  }) : super(key: key);

  final BodyHome widget;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DioHelper.getOperations(DateTime.now(), 1),
      builder: ((context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: snapshot.data![2].length,
          itemBuilder: (BuildContext context, int index) {
            if (snapshot.data == null) {
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  currentPage: 1,
                                  id: snapshot.data![2][index].id,
                                  callback: widget.callback,
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
                                          const Color.fromRGBO(238, 46, 93, 1),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Não',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color.fromRGBO(238, 46, 93, 1),
                                        ),
                                      ),
                                      onPressed: () async {
                                        DioHelper.deleteOperation(
                                            snapshot.data![2][index]);
                                        if (!mounted) return;
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(currentPage: 0),
                                          ),
                                        );

                                        widget.callback;
                                      },
                                      child: const Text(
                                        'Sim',
                                        style: TextStyle(color: Colors.white),
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
                        ),
                      ],
                    );
                  },
                );
              },
              child: BalanceContainer(
                expense: snapshot.data![2][index].entry == true ? false : true,
                origin: snapshot.data![2][index].name,
                value: snapshot.data![2][index].value,
                icon: IconData(snapshot.data![2][index].category.icon,
                    fontFamily: 'MaterialIcons'),
                source: snapshot.data![2][index].category.name,
                time: formatDate(snapshot.data![2][index].date.toString()),
              ),
            );
          },
        );
      }),
    );
  }
}
