import 'package:flutter/material.dart';

import '../../../shared/widgets/input_text_container.dart';
import 'combo_box.dart';
import 'custom_button.dart';
import 'custom_send_button.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BodyRegister extends StatelessWidget {
  final List<bool> isSelected = [false, false];
  final TextEditingController control1 = TextEditingController();
  final TextEditingController control2 = TextEditingController();

  BodyRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextInputContainer(textValue: 'Nome'),
        const TextInputContainer(
          textValue: 'Preço',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ToggleButtonsRegister(isSelected: isSelected),
          ],
        ),
        const ComboBox(),
        DateTimePicker(
          initialValue: '',
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          dateLabelText: 'Date',
          onChanged: (val) => print(val),
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print(val),
        ),
        const CustomSendButton(),
      ],
    );
  }
}

class ToggleButtonsRegister extends StatefulWidget {
  const ToggleButtonsRegister({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final List<bool> isSelected;
  @override
  State<ToggleButtonsRegister> createState() => _ToggleButtonsRegisterState();
}

class _ToggleButtonsRegisterState extends State<ToggleButtonsRegister> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: const BoxConstraints(minWidth: 175, minHeight: 50),
      isSelected: widget.isSelected,
      borderColor: Colors.lightBlueAccent,
      selectedBorderColor: Colors.red,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onPressed: (int index) {
        setState(() {
          widget.isSelected[index] = !widget.isSelected[index];
          if (widget.isSelected[0] && widget.isSelected[1]) {
            index == 0
                ? widget.isSelected[1] = false
                : widget.isSelected[0] = false;
          }
        });
      },
      children: const <Widget>[
        Icon(
          Icons.arrow_circle_up,
          size: 30,
          color: Colors.green,
        ),
        Icon(
          Icons.arrow_circle_down,
          size: 30,
          color: Colors.red,
        ),
      ],
    );
  }
}
