import 'package:flutter/material.dart';
import 'wrap_icons_one.dart';
import 'wrap_icons_two.dart';
import '../../../shared/widgets/input_text_container.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'wrap_icons.dart';

class NewCategoryBody extends StatefulWidget {
  const NewCategoryBody({Key? key}) : super(key: key);

  @override
  State<NewCategoryBody> createState() => _NewCategoryBodyState();
}

class _NewCategoryBodyState extends State<NewCategoryBody> {
  Color pickerColor = Color(0xff443a49);

  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void colorPicker() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            TextInputContainer(textValue: 'Nome da categoria'),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Ícone',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: const [WrapIcons(), WrapIconsOne(), WrapIconsTwo()],
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Cor',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InkWell(
              child: Text('Cor'),
              onTap: () {
                colorPicker();
              },
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 73, 112)),
                height: 40,
                width: 300,
                child: MaterialButton(
                  onPressed: () {},
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
