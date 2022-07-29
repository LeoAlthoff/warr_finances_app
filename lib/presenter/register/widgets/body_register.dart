import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/database_helper.dart';
import '../../../shared/utils/is_dark.dart';
import '../../../shared/widgets/input_text_container.dart';
import '../../category/new_category_page.dart';
import '../../home/home_page.dart';
import 'toggle_buttons_register.dart';

class BodyRegister extends StatefulWidget {
  int? id;

  BodyRegister({Key? key, this.id}) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final List<bool> isSelected = [false, false];

  final TextEditingController operationName = TextEditingController();

  final TextEditingController price = TextEditingController();

  String category = '';
  bool categorySelected = false;
  bool isEditing = false;
  bool getEditValues = false;

  TextEditingController data = TextEditingController();

  void cleanEntries() {
    isSelected[0] = false;
    isSelected[1] = false;
    category = '';
    categorySelected = false;
    operationName.clear();
    price.clear();
    data.clear();
    setState(() {});
  }

  int getOperation() {
    if (isSelected[0]) {
      return 1;
    } else if (isSelected[1]) {
      return 0;
    }
    return -1;
  }

  String formatDate(String date) {
    List temp = date.split('-');
    return temp.length == 3 ? ('${temp[2]}/${temp[1]}/${temp[0]}') : date;
  }

  Future<void> setEdit() async {
    List list = await DatabaseHelper.instance.selectOperationById(widget.id!);
    operationName.text = list[0]['name'];
    price.text = list[0]['value'].toString();
    data.text = list[0]['date'];
    categorySelected = true;
    category =
        await DatabaseHelper.instance.getCategoryName(list[0]['categoryId']);
    if (list[0]['entry'] == 1) {
      isSelected[0] = true;
      isSelected[1] = false;
    } else {
      isSelected[0] = false;
      isSelected[1] = true;
    }
    setState(() {});
  }

  void save() async {
    if (operationName.text == '' ||
        price.text == '' ||
        getOperation() == -1 ||
        data.text == '') {
      showDialogInvalidInfo();
    } else {
      String name = operationName.text;
      double value = double.parse(price.text);
      int operation = getOperation();
      String date = formatDate(data.text);
      int categoryId = await DatabaseHelper.instance.selectCategory(category);
      if (isEditing) {
        DatabaseHelper.instance.updateOperation(
            name, value, operation, date, categoryId, widget.id!);
        isEditing = false;
      } else {
        DatabaseHelper.instance
            .insertOperation(value, name, operation, date, categoryId);
      }
      showDialogSuccessfulRegister();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id != null && !getEditValues) {
      getEditValues = true;
      isEditing = true;
      setEdit();
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          TextInputContainer(
            textValue: 'Nome',
            controller: operationName,
          ),
          const SizedBox(height: 10),
          TextInputContainer(
            textValue: 'Preço',
            controller: price,
            type: const TextInputType.numberWithOptions(),
            numericFormatter: true,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtonsRegister(isSelected: isSelected),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: isDark(context) ? Colors.white38 : Colors.black38,
              ),
            ),
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: DatabaseHelper.instance.queryCategory(),
              builder: (
                context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot,
              ) {
                if (!snapshot.hasData ||
                    (category.isEmpty && categorySelected)) {
                  return const CircularProgressIndicator();
                }
                return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  hint: categorySelected
                      ? null
                      : const Text('Selecione uma categoria!'),
                  value: categorySelected ? category : null,
                  items: snapshot.data!
                      .map<DropdownMenuItem<String>>(
                        (Map<String, dynamic> value) =>
                            DropdownMenuItem<String>(
                          value: value['name'],
                          child: Text(
                            value['name'],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      categorySelected = true;
                      category = newValue!;
                    });
                  },
                ));
              },
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const NewCategoryPage()),
                ),
              );
            },
            child: const Text(
              'Criar uma nova categoria',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: isDark(context) ? Colors.white38 : Colors.black38,
              ),
            ),
            child: DateTimePicker(
              decoration: const InputDecoration(
                hintText: 'Data',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              controller: data,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              locale: const Locale('pt', 'BR'),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    if (isEditing) {
                      showAlertDialogCancelEdit(context);
                    } else {
                      cleanEntries();
                      setState(() {});
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade400)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Text(
                      isEditing ? 'Cancelar' : 'Limpar',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    save();
                    if (isEditing) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(currentPage: 0),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 46, 93, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Text(
                      isEditing ? 'Atualizar' : 'Enviar',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showAlertDialogCancelEdit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancelar'),
          content: const Text('Deseja cancelar a edição?'),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(238, 46, 93, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Não',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(238, 46, 93, 1)),
              ),
              onPressed: () {
                isEditing = false;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(currentPage: 0),
                  ),
                );
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
  }

  Future<dynamic> showDialogSuccessfulRegister() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cadastro'),
          content: const Text('Cadastro realizado com sucesso!'),
          actions: [
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(238, 46, 93, 1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }

  Future<dynamic> showDialogInvalidInfo() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Informações inválidas!'),
          content: const Text('Você não pode deixar nenhum campo em branco.'),
          actions: [
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(238, 46, 93, 1)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }
}
