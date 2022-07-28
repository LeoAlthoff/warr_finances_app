import 'package:flutter/material.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ToggleButtons(
        constraints: BoxConstraints(
            minWidth: (MediaQuery.of(context).size.width - 63) / 2,
            minHeight: 50),
        isSelected: widget.isSelected,
        borderColor: Colors.grey,
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
      ),
    );
  }
}
