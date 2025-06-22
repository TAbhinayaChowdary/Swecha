import 'package:flutter/material.dart';
import 'register.dart';
import 'loginVol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Camp Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSerif',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const LoginPage(),
      routes: {
        '/register': (context) => const RegisterPage(),
        '/loginVol': (context) => const VolunteerLoginPage(),
        // Add other routes here (e.g., dashboards for each role)
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _loginAs(BuildContext context, String role) {
    if (role == 'Volunteer') {
      Navigator.pushNamed(context, '/loginVol');
      return;
    }
    // TODO: Implement authentication logic for Admin and User
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login as $role (implement logic)')),
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Swecha\'s Medical Camp',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontFamily: 'NotoSerif',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _loginAs(context, 'Admin'),
                child: const Text('Login as Admin'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _loginAs(context, 'Volunteer'),
                child: const Text('Login as Volunteer'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _loginAs(context, 'User'),
                child: const Text('Login as User'),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New here? "),
                  GestureDetector(
                    onTap: () => _navigateToRegister(context),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
