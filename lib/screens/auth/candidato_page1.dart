import 'package:flutter/material.dart';

class CandidatoPage1 extends StatelessWidget {
  const CandidatoPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Botón superior que regresa
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF2C252F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Sign up candidate",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Contenedor principal
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF201E1F),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: const Border(
                  top: BorderSide(color: Colors.orange, width: 3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Indicadores de pasos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.orange,
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          if (index != 3)
                            Container(
                              width: 30,
                              height: 3,
                              color: Colors.white,
                            ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Let's start with your details to log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Campo Full Name
                  buildTextField("Full name"),
                  const SizedBox(height: 15),

                  // Campo Email
                  buildTextField("Email"),
                  const SizedBox(height: 15),

                  // Campo Password
                  buildTextField("Password", isPassword: true),
                  const SizedBox(height: 20),

                  // Checkboxes
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (val) {},
                        side: const BorderSide(color: Colors.white),
                      ),
                      const Text(
                        "Are you a U.S. Citizen?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (val) {},
                        side: const BorderSide(color: Colors.white),
                      ),
                      const Text(
                        "Are you over 18?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    "This question is optional. It is asked because some positions may have specific requirements related to citizenship.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botón Next
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDA6C21),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                text: "Información de la ",
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: "empresa",
                    style: TextStyle(
                      color: Color(0xFFDA6C21),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Campo de texto reutilizable
  static Widget buildTextField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: const Color(0xFF2C252F),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.orange),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.orange, width: 1.5),
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
