import 'package:flutter/material.dart';
import 'package:flutter_teste_app/presenter/home/home_page.dart';
import 'package:flutter_teste_app/shared/widgets/input_text_container.dart';
import '../../../shared/widgets/input_text_container.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NewCategoryBody extends StatefulWidget {
  const NewCategoryBody({Key? key}) : super(key: key);

  @override
  State<NewCategoryBody> createState() => _NewCategoryBodyState();
}

class _NewCategoryBodyState extends State<NewCategoryBody> {
  Color pickerColor = const Color.fromARGB(255, 102, 23, 141);

  Color currentColor = Colors.blueGrey.shade100;

  List<bool> _selections = List.generate(3, (_) => false);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void colorPicker() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Escolha a cor da Categoria',
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                  print(currentColor);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(238, 46, 93, 1),
        title: const Center(
          child: Text('Criar nova categoria'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextInputContainer(textValue: 'Nome da categoria'),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Ícone',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 200,
            //     enableInfiniteScroll: false,
            //     reverse: false,
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //   ),
            //   items: const [WrapIcons(), WrapIconsOne(), WrapIconsTwo()],
            // ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Cor',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: const Text(
                    'Escolha uma cor:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    colorPicker();
                  },
                ),
                const SizedBox(width: 35),
                InkWell(
                  onTap: () {
                    colorPicker();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: currentColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(238, 46, 93, 1),
                ),
                height: 40,
                width: 300,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => HomePage(currentPage: 1)),
                      ),
                    );
                  },
                  child: const Text(
                    'Salvar categoria',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
