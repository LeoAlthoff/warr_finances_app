import 'package:flutter/material.dart';

import 'widgets/combo_box.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_send_button.dart';
import '../../shared/widgets/input_text_container.dart';

void main() {
  runApp(const MaterialApp(
    title: 'MeuAppTeste',
    home: RegistrationPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                  textValue: 'Income',
                ),
                CustomButton(
                  income: false,
                  textValue: 'Outcome',
                ),
              ],
            ),
            const ComboBox(),

            // Imagem
            Image.asset(
              'assets/images/cadastro.png',
              // height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            // Terminar button
            const CustomSendButton(),
          ],
        ),
      ),
    );
  }
}
