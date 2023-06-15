// ignore_for_file: library_private_types_in_public_api

import 'package:app_tcc/pages/confirm_test_page.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final int _selectedIndex = 0;

  void _navigateToConfirmTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfirmTestPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 100, // Defina uma altura adequada aqui
        child: Scaffold(
          body: Center(
            child: Text('Index $_selectedIndex'),
          ),
          bottomNavigationBar: Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor:
                  0.6, // Define a largura do botão como 40% da largura disponível
              child: TextButton(
                onPressed: _navigateToConfirmTestPage,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color?>(
                    null,
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black12;
                      }
                      return null;
                    },
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      'FINALIZAR PROVA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Graphik',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
