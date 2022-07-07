import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'MeuAppTeste',
    home: const HomePage(),
    theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 52, 105),
        title: const Text('Olá, Rodrigo'),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.drag_handle_sharp),
            label: "Extrato",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Cadastrar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: "Resumo",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Entradas',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_circle_up,
                          size: 35,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'R\$ 18.000,00',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('Última entrada dia 1º de julho'),
                  ],
                ),
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
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Warren Tecnologia',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'R\$ 2.500,00',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.attach_money_outlined, size: 23),
                            SizedBox(width: 10),
                            Text(
                              'Salário',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        const Text(
                          "01/07/2022",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ifood',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '- R\$ 250,00',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.restaurant,
                              size: 23,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Alimentação',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        const Text(
                          "25/06/2022",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Angeloni',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '- R\$ 620,00',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.shopping_bag_outlined, size: 23),
                            SizedBox(width: 10),
                            Text(
                              'Mercado',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        const Text(
                          "18/06/2022",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Professor Ailton',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'R\$ 15.500,00',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.attach_money_outlined,
                              size: 23,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'PIX',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        const Text(
                          "01/07/2022",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
