import 'package:flutter/material.dart';
import '../screens/auth/candidato_page1.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/sign_up_now_screen.dart';
// Make sure the imported file defines a class named SignUpNowScreen.
// If the class is named differently (e.g., SignUpScreen), update the import and usage below accordingly.

class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String candidato = '/candidato';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case candidato:
        return MaterialPageRoute(builder: (_) => const CandidatoPage1());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
