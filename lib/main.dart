import 'package:candito5_week/product/constants/string_constants.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.welcometitle),
        ),
        body: const Center(
          child: Text(StringConstants.onboardingBenchText),
        ),
      ),
    );
  }
}
