import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_tcc/pages/login_page.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // usuário logado

          if (snapshot.hasData) {
            return HomePage(
              context: context,
            );
          }

          // usuário NÃO logado

          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
