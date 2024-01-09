import 'package:candito5_week/feature/home/dashboard_view.dart';
import 'package:candito5_week/feature/home/home_view.dart';
import 'package:candito5_week/feature/login/login_view.dart';
import 'package:candito5_week/product/constants/string_constants.dart';
import 'package:candito5_week/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candito 5 Week',
      home: DashBoard(),
      theme: ThemeData.dark(),
    );
  }
}
