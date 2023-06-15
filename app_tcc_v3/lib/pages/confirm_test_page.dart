import 'package:app_tcc/pages/home_page.dart';
import 'package:flutter/material.dart';

class ConfirmTestPage extends StatelessWidget {
  const ConfirmTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  context: context,
                )),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 80,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'PROVA FINALIZADA!',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Graphik',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4500)),
            ),
          ],
        ),
      ),
    );
  }
}
