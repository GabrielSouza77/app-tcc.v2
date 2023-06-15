import 'package:app_tcc/pages/home_page.dart';
import 'package:app_tcc/pages/last_question_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../components/question_card.dart';
import '../components/radio_list_tile.dart';
import '../components/radio_button_state.dart';

class FirstQuestionPage extends StatefulWidget {
  const FirstQuestionPage({Key? key}) : super(key: key);

  @override
  State<FirstQuestionPage> createState() => _FirstQuestionPageState();
}

class _FirstQuestionPageState extends State<FirstQuestionPage> {
  set isSelected(bool isSelected) {}

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
            const SizedBox(height: 25),
            const QuestionCard(
              questionText:
                  'O preço para o litro de álcool no posto Astrogildo é de R\u0024 1,19, e o frentista completou  o  tanque de  um  carro  com  40  litros. Sabendo  que  a  função  f(x)= 1,19x  +  0,15  descreve  o  valor  total  a  ser pago  por  cada cliente,  quando abastece seu veículo, assinale a alternativa abaixo com o valor total a ser pago pelos 40 litros de álcool.',
              questionTextFontSize: 16,
              questionTitleFontSize: 32,
            ),
            const SizedBox(height: 50),
            CustomRadioButton(
              text: 'R\u0024 47,60',
              isSelected: radioButtonState.selectedOption == 'R\u0024 47,60',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 47,60';
                  });
                }
              },
            ),
            CustomRadioButton(
              text: 'R\u0024 47,65',
              isSelected: radioButtonState.selectedOption == 'R\u0024 47,65',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 47,65';
                  });
                }
              },
            ),
            CustomRadioButton(
              text: 'R\u0024 47,70',
              isSelected: radioButtonState.selectedOption == 'R\u0024 47,70',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 47,70';
                  });
                }
              },
            ),
            CustomRadioButton(
              text: 'R\u0024 47,75',
              isSelected: radioButtonState.selectedOption == 'R\u0024 47,75',
              onChanged: (value) {
                if (value) {
                  setState(() {
                    radioButtonState.selectedOption = 'R\u0024 47,75';
                  });
                }
              },
            ),
            const SizedBox(height: 50),
            MyButton(
              buttonText: 'PRÓXIMA',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LastQuestionPage(),
                  ),
                );
              },
              margin: const EdgeInsets.symmetric(horizontal: 75),
              boxDecoration: BoxDecoration(
                color: const Color(0xFFFF8C00),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
