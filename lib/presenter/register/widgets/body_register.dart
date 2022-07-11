import 'package:flutter/material.dart';

import '../../../shared/widgets/input_text_container.dart';
import 'combo_box.dart';
import 'custom_button.dart';
import 'custom_send_button.dart';

class BodyRegister extends StatelessWidget {
  const BodyRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextInputContainer(
          textValue: 'Nome',
        ),
        const TextInputContainer(
          textValue: 'Preço',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CustomButton(
              income: true,
              textValue: 'Entrada',
            ),
            CustomButton(
              income: false,
              textValue: 'Saída',
            ),
          ],
        ),
        const ComboBox(),
        Image.asset(
          'assets/images/cadastro.png',
          width: MediaQuery.of(context).size.width,
        ),
        const CustomSendButton(),
      ],
    );
  }
}
