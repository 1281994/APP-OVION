import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ovion App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login', // Esta es la pantalla inicial
      onGenerateRoute: AppRoutes.generateRoute, // Usa tu sistema de rutas
    );
  }
}
