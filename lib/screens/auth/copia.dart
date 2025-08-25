import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _showErrorBorder = false;
  void _resetErrorBorder() {
    if (_showErrorBorder) {
      setState(() {
        _showErrorBorder = false;
      });
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Usuario de prueba: alex / 123
    if (email == 'alex' && password == '123') {
      setState(() {
        _showErrorBorder = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login exitoso!')));
    } else {
      setState(() {
        _showErrorBorder = true;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // X en círculo rojo solo borde
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 3),
                ),
                child: Center(
                  child: Icon(Icons.close, color: Colors.red, size: 40),
                ),
              ),
              SizedBox(height: 16),
              // Mensaje ADVERTENCIA en negritas
              Text(
                'ADVERTENCIA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              // Texto de error
              Text(
                'Su nombre y contraseña no coinciden',
                style: TextStyle(color: Colors.black87, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Botón OK
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 115, 0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('OK'),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Título Login estilizado como botón
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 8.0, top: 8.0),
              padding: EdgeInsets.symmetric(vertical: 14.0),
              decoration: BoxDecoration(
                color: Color(0xFF232323),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            // Panel ocupa todo el espacio restante
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    255,
                    32,
                    30,
                    31,
                  ), // Panel fondo personalizado
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border(
                    top: BorderSide(color: Colors.orange, width: 6),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 28),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 100.0,
                        ),
                      ),
                      // Welcome back text
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 32.0),
                      // Email field
                      TextField(
                        controller: _emailController,
                        onChanged: (_) => _resetErrorBorder(),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.orange),
                          filled: true,
                          fillColor: Color.fromARGB(
                            255,
                            63,
                            57,
                            57,
                          ), // Fondo input personalizado
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: _showErrorBorder
                                  ? Colors.red
                                  : Colors.orange,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 18.0),
                      // Password field
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        onChanged: (_) => _resetErrorBorder(),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.orange),
                          filled: true,
                          fillColor: Color.fromARGB(
                            255,
                            63,
                            57,
                            57,
                          ), // Fondo input personalizado
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: _showErrorBorder
                                  ? Colors.red
                                  : Colors.orange,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _showErrorBorder
                                  ? Colors.red
                                  : Colors.white70,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 24.0),
                      // Login button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      // Sign up link
                      TextButton(
                        onPressed: () {
                          // Implementar navegación a Sign up
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Don\'t have an account ',
                            style: TextStyle(color: Colors.white70),
                            children: [
                              TextSpan(
                                text: 'Sign up now',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
