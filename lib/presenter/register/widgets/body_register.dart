import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/database_helper.dart';
import '../../../shared/utils/date_formater.dart';
import '../../../shared/utils/is_dark.dart';
import '../../../shared/widgets/input_text_container.dart';
import '../../category/new_category_page.dart';
import '../utils/show_dialog_cancel_edit.dart';
import '../utils/show_dialog_successful.dart';
import 'date_time_picker_container.dart';
import 'dialog_invalid_info.dart';
import 'toggle_buttons_register.dart';

class BodyRegister extends StatefulWidget {
  final User user;
  final Function? callback;
  final int? id;

  const BodyRegister({Key? key, this.id, required this.user, this.callback})
      : super(key: key);

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

  final FocusNode focusPrice = FocusNode();

  TextEditingController data = TextEditingController();

  @override
  Widget build(BuildContext context) {
    checkEditing();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        TextInputContainer(
          nextFocus: focusPrice,
          textValue: 'Nome',
          controller: operationName,
        ),
        const SizedBox(height: 10),
        TextInputContainer(
          focusNode: focusPrice,
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
              if (!snapshot.hasData || (category.isEmpty && categorySelected)) {
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
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => NewCategoryPage(
                      user: widget.user,
                    )),
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
        DateTimePickerContainer(data: data),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (isEditing) {
                    showAlertDialogCancelEdit(
                      context,
                      isEditing,
                      widget.callback,
                      widget.user,
                    );
                  } else {
                    cleanEntries();
                    setState(() {});
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
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
                onPressed: () async {
                  save();
                  widget.callback;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 46, 93, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
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
    );
  }

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

  void checkEditing() {
    if (widget.id != null && !getEditValues) {
      getEditValues = true;
      isEditing = true;
      setEdit();
    }
  }

  Future<void> setEdit() async {
    List list = await DatabaseHelper.instance.selectOperationById(widget.id!);
    operationName.text = list[0]['name'];
    price.text = list[0]['value'].toString();
    data.text = formatStringForDateTimeParse(list[0]['date']);
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

  void save() {
    if (checkInputValidator()) {
      showDialogInvalidInfo('Você não pode deixar nenhum campo em branco.');
    } else {
      saveInputOperation();
      showDialogSuccessfulRegister(context, widget.user, cleanEntries);
    }
  }

  void saveInputOperation() async {
    String name = operationName.text;
    double value = double.parse(price.text);
    int operation = getOperation();
    String date = data.text;
    int categoryId = await DatabaseHelper.instance.selectCategory(category);

    if (isEditing) {
      DatabaseHelper.instance.updateOperation(
        name,
        value,
        operation,
        date,
        categoryId,
        widget.id!,
      );
      isEditing = false;
    } else {
      DatabaseHelper.instance.insertOperation(
        value,
        name,
        operation,
        date,
        categoryId,
      );
    }
  }

  bool checkInputValidator() {
    if (operationName.text == '') {
      return true;
    }
    if (price.text == '') {
      return true;
    }
    if (getOperation() == -1) {
      return true;
    }
    if (data.text == '') {
      return true;
    }
    return false;
  }

  Future<dynamic> showDialogInvalidInfo(String msg) {
    return showDialog(
      context: context,
      builder: (context) {
        return DialogInvalidInfo(msg: msg);
      },
    );
  }
}
