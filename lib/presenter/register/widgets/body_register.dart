import 'package:flutter/material.dart';

import 'package:flutter_teste_app/dio/model/category_model.dart';
import 'package:flutter_teste_app/dio/model/operation_model.dart';
import 'package:intl/intl.dart';

import '../../../dio/dio_helper.dart';
import '../../../shared/utils/date_formater.dart';
import '../../../shared/utils/is_dark.dart';
import '../../../shared/utils/shared_preferences.dart';
import '../../../shared/widgets/input_text_container.dart';
import '../../category/new_category_page.dart';
import '../utils/show_dialog_cancel_edit.dart';
import '../utils/show_dialog_successful.dart';
import 'date_time_picker_container.dart';
import 'dialog_invalid_info.dart';
import 'toggle_buttons_register.dart';

class BodyRegister extends StatefulWidget {
  final Function? callback;
  final OperationModel? operation;

  const BodyRegister({
    Key? key,
    this.callback,
    this.operation,
  }) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final List<bool> isSelected = [false, false];

  final TextEditingController operationNameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  int? categoryId;
  String category = '';
  bool categorySelected = false;
  bool isEditing = false;
  bool getEditValues = false;

  final FocusNode focusPrice = FocusNode();

  DateTime dateRaw = DateTime.now();

  TextEditingController data = TextEditingController(text: 'Selecione uma data');

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
          controller: operationNameController,
        ),
        const SizedBox(height: 10),
        TextInputContainer(
          focusNode: focusPrice,
          textValue: 'Preço',
          controller: priceController,
          type: const TextInputType.numberWithOptions(),
          numericFormatter: true,
        ),
        const SizedBox(height: 15),
        ToggleButtonsRegister(isSelected: isSelected),
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
          child: FutureBuilder<List<CategoryModel>>(
            future: DioHelper.getAllCategories(
              SharedPreferencesHelper.prefs!.getInt("UserId")!,
            ),
            builder: (
              context,
              AsyncSnapshot<List<CategoryModel>> snapshot,
            ) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  hint: categorySelected
                      ? null
                      : const Text('Selecione uma categoria'),
                  value: categoryId,
                  items: snapshot.data!
                      .map<DropdownMenuItem<int>>(
                        (CategoryModel category) => DropdownMenuItem<int>(
                          value: category.id,
                          child: Text(
                            category.name,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (var newValue) {
                    categorySelected = true;
                    categoryId = newValue;
                    setState(() {});
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
    categoryId = null;
    operationNameController.clear();
    priceController.clear();
    data.clear();
    data.text = 'Selecione uma data';
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
    if (widget.operation != null && !getEditValues) {
      getEditValues = true;
      isEditing = true;
      setEdit();
    }
  }

  Future<void> setEdit() async {
    operationNameController.text = widget.operation!.name;
    priceController.text = widget.operation!.value.toString();
    data.text = widget.operation!.date.toString();
    categorySelected = true;
    categoryId = widget.operation!.category!.id;

    if (widget.operation!.entry == true) {
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
      showDialogSuccessfulRegister(context, cleanEntries);
    }
  }

  void saveInputOperation() async {
    String name = operationNameController.text;
    double value = double.parse(priceController.text);
    DateTime date = DateTime.parse(data.text);

    if (isEditing) {
      DioHelper.updateOperation(
        OperationModel(
          id: widget.operation!.id,
          name: name,
          value: value,
          date: date,
          categoryId: categoryId!,
          entry: getOperation() == 1 ? true : false,
          userId: SharedPreferencesHelper.prefs!.getInt("UserId")!,
        ),
      );

      isEditing = false;
    } else {
      DioHelper.createOperation(
        OperationModel(
          id: 0,
          name: name,
          value: value,
          date: date,
          categoryId: categoryId!,
          entry: getOperation() == 1 ? true : false,
          userId: SharedPreferencesHelper.prefs!.getInt("UserId")!,
        ),
      );
    }
  }

  bool checkInputValidator() {
    if (operationNameController.text == '') {
      return true;
    }
    if (priceController.text == '') {
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
