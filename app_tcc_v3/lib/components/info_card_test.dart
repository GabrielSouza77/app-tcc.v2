import 'package:flutter/material.dart';

class CardInitTest extends StatelessWidget {
  const CardInitTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle normalTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontFamily: 'Graphik',
      fontWeight: FontWeight.normal,
    );

    const TextStyle boldTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontFamily: 'Graphik',
      fontWeight: FontWeight.w600,
    );

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.all(30),
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
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "A ",
                  style: normalTextStyle,
                ),
                Text(
                  "prova de ",
                  style: boldTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "nivelamento ",
                  style: boldTextStyle,
                ),
                Text(
                  "é um ",
                  style: normalTextStyle,
                ),
              ],
            ),
            Text(
              "teste que tem o intuito de ajudar o professor nas aulas de revisão. É uma prova que contém X questões que envolvem matérias de matemática vistas no Ensino Médio.",
              style: normalTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
