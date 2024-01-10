import 'package:candito5_week/screens/current_lift_screen.dart';
import 'package:flutter/material.dart';

class LiftsScreen extends StatelessWidget {
  LiftsScreen({super.key});
  final List<LiftType> liftTypes = LiftType.values;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: liftTypes.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return CurrentLiftScreen(
            liftType: liftTypes[index],
            pageController: pageController,
          );
        },
      ),
    );
  }
}
