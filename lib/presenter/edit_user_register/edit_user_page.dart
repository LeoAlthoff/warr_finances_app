import 'package:flutter/material.dart';

import '../../shared/utils/constants.dart';
import '../../shared/utils/is_dark.dart';
import '../../shared/widgets/input_text_container.dart';

class EditUserPage extends StatefulWidget {
  final String email;
  const EditUserPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark(context)
            ? const Color.fromARGB(214, 238, 46, 94)
            : const Color.fromRGBO(238, 46, 93, 1),
        title: const Text('Alterar informações'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height - 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextInputContainer(
                textValue: 'nome',
                controller: nameController,
              ),
              TextInputContainer(
                textValue: 'email',
                controller: emailController,
              ),
              TextInputContainer(
                textValue: 'Senha',
                controller: passwordController,
              ),
              TextInputContainer(
                textValue: 'Confirmar senha',
                controller: confirmPasswordController,
              ),
              TextButton(
                onPressed: () {
                  if (checkFormValidator()) {
                    //TODO UPDATE USER
                    Navigator.of(context).pop();
                    alertDialog(
                        context, 'Cadastro', 'Cadastro realizado com sucesso!');
                  } else {
                    alertDialog(context, 'Erro ao cadastrar',
                        'Não deixe nenhuma informação em branco e nao coloque senhas diferentes nos campos');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDark(context)
                        ? const Color.fromARGB(214, 238, 46, 94)
                        : const Color.fromRGBO(238, 46, 93, 1),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  child: const Text(
                    'Atualizar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkFormValidator() {
    if (nameController.text == '') {
      return false;
    }
    if (emailController.text == '') {
      return false;
    }
    if (passwordController.text == '') {
      return false;
    }
    if (confirmPasswordController.text == '') {
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      return false;
    }
    return true;
  }
}
