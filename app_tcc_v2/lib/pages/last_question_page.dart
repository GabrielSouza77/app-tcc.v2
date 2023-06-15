import 'package:app_tcc/pages/first_question_page.dart';
import 'package:flutter/material.dart';
import 'package:app_tcc/pages/home_page.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../components/question_card.dart';
import '../components/radio_list_tile.dart';
import '../components/bottom_navigation_custom.dart';
import '../components/radio_button_state.dart'; // Importe o arquivo bottom_navigation_bar.dart

class LastQuestionPage extends StatefulWidget {
  const LastQuestionPage({Key? key}) : super(key: key);

  @override
  State<LastQuestionPage> createState() => _LastQuestionPageState();
}

class _LastQuestionPageState extends State<LastQuestionPage> {
  set isSelected(bool isSelected) {}
  bool showBottomBar = false;

  @override
  Widget build(BuildContext context) {
    final radioButtonState =
        Provider.of<RadioButtonState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(context: context),
                  ),
                );
              },
              icon: const Icon(
                Icons.close,
                color: Color(0xFFFF8C00),
                size: 40,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.3, // Adjust the height as needed
              child: const QuestionCard(
                questionText:
                    'Uma pessoa comprou quatro cadeiras iguais para sua cozinha, pagando R\u0024 120,00 por cada uma delas, três cadeiras de praia por R\u0024 90,00 cada uma delas e dois banquinhos iguais, de madeira. Considerando-se o total de peças compradas, na média, o preço de uma peça saiu por R\u0024 94,00. O preço de cada banquinho era de:',
                questionTextFontSize: 16,
                questionTitleFontSize: 24,
              ),
            ),
            const SizedBox(height: 15),
            CustomRadioButton(
              text: 'R\u0024 52,00',
              isSelected: radioButtonState.selectedOption == 'R\u0024 52,00',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 52,00';
                    showBottomBar = true;
                  });
                }
              },
            ),
            CustomRadioButton(
              text: 'R\u0024 48,00',
              isSelected: radioButtonState.selectedOption == 'R\u0024 48,00',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 48,00';
                    showBottomBar = true;
                  });
                }
              },
            ),
            CustomRadioButton(
              text: 'R\u0024 56,00',
              isSelected: radioButtonState.selectedOption == 'R\u0024 56,00',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 56,00';
                    showBottomBar = true;
                  });
                }
              },
            ),
            CustomRadioButton(
              text: 'R\u0024 44,00',
              isSelected: radioButtonState.selectedOption == 'R\u0024 44,00',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 44,00';
                    showBottomBar = true;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 200, top: 50),
              child: MyButton(
                buttonText: 'ANTERIOR',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstQuestionPage()),
                  );
                },
                boxDecoration: BoxDecoration(
                  color: const Color(0xFFFF8C00),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 75),
            if (showBottomBar)
              Container(
                  alignment: Alignment.bottomCenter,
                  child:
                      const CustomNavigationBar()), // Replace with your custom BottomNavigationBar widget
          ],
        ),
      ),
    );
  }
}
