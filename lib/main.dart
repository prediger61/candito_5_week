import 'package:candito5_week/product/provider/user_provider.dart';
import 'package:candito5_week/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Candito 5 Week',
        home: const SplashScreen(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
