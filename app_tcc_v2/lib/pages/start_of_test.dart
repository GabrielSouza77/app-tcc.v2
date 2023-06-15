import 'package:flutter/material.dart';
import '../components/info_card_test.dart';
import '../components/my_button.dart';
import 'package:app_tcc/pages/first_question_page.dart';

class InitialTestPage extends StatelessWidget {
  final BuildContext context;
  const InitialTestPage({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFF8C00),
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 125,
              height: 125,
              child: Image.asset('lib/images/fatec.png'),
            ),
            const SizedBox(height: 25),
            const CardInitTest(),
            const SizedBox(height: 50),
            MyButton(
              buttonText: 'INICIAR',
              margin: const EdgeInsets.symmetric(horizontal: 75),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstQuestionPage(),
                  ),
                );
              },
              boxDecoration: BoxDecoration(
                color: const Color(0xFFFF8C00),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
