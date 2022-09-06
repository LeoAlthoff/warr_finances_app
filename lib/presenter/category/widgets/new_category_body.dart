import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_teste_app/shared/utils/shared_preferences.dart';

import '../../../dio/dio_helper.dart';
import '../../../dio/model/category_model.dart';
import '../../../shared/utils/constants.dart';
import '../../../shared/utils/get_color_bytheme.dart';
import '../../../shared/utils/shared_preferences.dart';
import '../../../shared/widgets/input_text_container.dart';
import '../../home/home_page.dart';

class NewCategoryBody extends StatefulWidget {
  const NewCategoryBody({
    Key? key,
  }) : super(key: key);

  @override
  State<NewCategoryBody> createState() => _NewCategoryBodyState();
}

class _NewCategoryBodyState extends State<NewCategoryBody> {
  final categoryController = TextEditingController();

  late int indexIcon;

  Color pickerColor = const Color.fromARGB(255, 102, 23, 141);

  Color currentColor = const Color.fromRGBO(238, 46, 93, 1);
  int currentCodeColor = 0;

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
                },
              ),
            ],
          );
        });
  }

  void saveCategory() {
    if (categoryController.text == '' || indexIcon.toString() == '') {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Informações inválidas!'),
            content: const Text('Você não pode deixar nenhum campo em branco.'),
            actions: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(238, 46, 93, 1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        },
      );
    } else {
      // DatabaseHelper.instance.insertCategory(categoryController.text.toString(),
      //     currentColor.value, iconList[indexIcon].codePoint);

      //TODO: Alterar Id do usuário

      CategoryModel category = CategoryModel(
        name: categoryController.text.toString(),
        color: currentColor.value,
        icon: iconList[indexIcon].codePoint,
        id: 0,
        userId: SharedPreferencesHelper.prefs!.getInt("UserId")!,
      );
      DioHelper.createCategory(category);

      isSelected[indexIcon] = false;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            currentPage: 1,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            TextInputContainer(
              textValue: 'Nome da categoria',
              controller: categoryController,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Ícone',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Ink(
                padding: const EdgeInsets.all(20.0),
                width: 1200,
                height: 220,
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  primary: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                  children: List.generate(isSelected.length, (index) {
                    return InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        splashColor: const Color.fromRGBO(238, 46, 93, 1),
                        onTap: () {
                          setState(() {
                            for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
                              if (indexBtn == index) {
                                isSelected[indexBtn] = true;
                              } else {
                                isSelected[indexBtn] = false;
                              }
                            }
                          });
                          indexIcon = index;
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: isSelected[index]
                                ? getColorByTheme(context)
                                : getColorByTheme(context),
                            borderRadius: BorderRadius.circular(30),
                            border: isSelected[index]
                                ? Border.all(color: Colors.black54, width: 2)
                                : Border.all(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                          ),
                          child: Icon(
                            iconList[index],
                            color: isSelected[index] ? currentColor : Colors.grey,
                            size: isSelected[index] ? 32 : 28,
                          ),
                        ));
                  }),
                ),
              ),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: InkWell(
                onTap: () {
                  colorPicker();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Escolha uma cor:',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 35),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: currentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(238, 46, 93, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MaterialButton(
                  onPressed: () {
                    saveCategory();
                    setState(() {});
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
            ),
          ],
        ),
      ),
    );
  }
}
