import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/is_dark.dart';

class DateTimePickerContainer extends StatelessWidget {
  const DateTimePickerContainer({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TextEditingController data;

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
    );
  }
}
