import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_tcc/components/my_button.dart';
import 'package:app_tcc/components/my_textfield.dart';
import 'package:app_tcc/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final String senha = 'teste123';

  // sign user in method
  void signUserIn() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    // sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: senha);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      }
    }
  }

  // wrong email popup

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro de Email'),
          content: const Text(
              'O email fornecido é inválido. Por favor, verifique e tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 75),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // fatec logo
                  SquareTile(imagePath: 'lib/images/fatec.png')
                ],
              ),

              const SizedBox(height: 100),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'email@fatec.sp.gov.br',
                obscureText: false,
              ),

              const SizedBox(height: 150),

              // sign in button
              MyButton(
                buttonText: 'ENTRAR',
                onTap: signUserIn,
                boxDecoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 75),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
