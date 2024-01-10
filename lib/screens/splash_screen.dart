import 'package:candito5_week/feature/home/dashboard_view.dart';
import 'package:candito5_week/feature/login/login_view.dart';
import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:candito5_week/product/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkUser(BuildContext context, String username) async {
    final prefs = await SharedPreferences.getInstance();
    final registeredUsers = prefs.getStringList('users') ?? [];

    if (registeredUsers.contains(username)) {
      // Username exists, navigate to Home Screen
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    } else {
      // Username doesn't exist, navigate to Login Screen
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    }
  }

  Future<void>getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';

    await checkUser(context, username);
  }

  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await getPrefs();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  StringConstants.appName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              StringConstants.appName,
              style: TextStyle(
                color: ColorConstants.systemGrayLight,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
