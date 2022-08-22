import 'package:flutter/material.dart';

import '../../../shared/utils/date_formater.dart';
import '../../../shared/utils/is_dark.dart';

class DateTimePickerContainer extends StatefulWidget {
  const DateTimePickerContainer({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TextEditingController data;

  @override
  State<DateTimePickerContainer> createState() =>
      _DateTimePickerContainerState();
}

class _DateTimePickerContainerState extends State<DateTimePickerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextButton(
        onPressed: () async {
          widget.data.text = (await _selectDate(context)).toString();
          setState(() {});
        },
        child: Text(
          widget.data.text != 'Selecione uma data'
              ? formatDate(widget.data.text)
              : widget.data.text,
          style: TextStyle(
            fontSize: 16,
            color: widget.data.text.length > 17
                ? Theme.of(context).hintColor
                : isDark(context)
                    ? Colors.white
                    : Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: isDark(context)
                  ? const Color.fromARGB(214, 238, 46, 94)
                  : const Color.fromRGBO(
                      238, 46, 93, 1), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: isDark(context)
                  ? Colors.white
                  : Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: isDark(context)
                    ? const Color.fromARGB(214, 238, 46, 94)
                    : const Color.fromRGBO(238, 46, 93, 1), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }
}
