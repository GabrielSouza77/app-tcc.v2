import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;
  final double questionTextFontSize;
  final double questionTitleFontSize;

  const QuestionCard({
    Key? key,
    required this.questionText,
    required this.questionTextFontSize,
    required this.questionTitleFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle normalTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Graphik',
      fontWeight: FontWeight.normal,
      fontSize: questionTextFontSize,
    );

    TextStyle boldTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Graphik',
      fontWeight: FontWeight.bold,
      fontSize: questionTitleFontSize,
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Questão X",
              style: boldTextStyle,
            ),
          ),
          Text(
            questionText,
            style: normalTextStyle,
          ),
        ],
      ),
    );
  }
}
