import 'package:candito5_week/feature/home/dashboard_view.dart';
import 'package:candito5_week/feature/login/login_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  TextEditingController usernameController = TextEditingController();
  static const color = Color.fromRGBO(201, 252, 110, 45);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: 150,
                height: 75,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: const Center(
                  child: Text(
                    'Welcome to Candito 5 Week',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Kullanıcı Adı',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Şifre',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final isLoggedIn = await loginUser(usernameController.text);
                  if (isLoggedIn) {
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const DashBoard(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
