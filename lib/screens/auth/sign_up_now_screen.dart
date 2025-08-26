import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF2C252F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
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
                children: [
                  // Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png', height: 40),
                      const SizedBox(width: 8),
                      const Text(
                        "OVION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Título
                  const Text(
                    "Welcome back! Ready to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Subtítulo
                  const Text(
                    "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  // Card Company
                  buildOptionCard(
                    icon: Icons.business,
                    title: "Company",
                    description:
                        "of the printing and typesetting industry. Lorem Ipsum has been",
                  ),
                  const SizedBox(height: 20),
                  // Card Candidate
                  buildOptionCard(
                    icon: Icons.person,
                    title: "Candidate",
                    description:
                        "of the printing and typesetting industry. Lorem Ipsum has been",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Already registerd? login",
                style: TextStyle(color: Colors.orange, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildOptionCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Builder(
      builder: (context) {
        final isCandidate = title == "Candidate";
        return GestureDetector(
          onTap: isCandidate
              ? () {
                  Navigator.pushNamed(context, '/candidato');
                }
              : null,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF2C252F),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.orange, size: 35),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
