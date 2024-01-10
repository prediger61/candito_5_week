import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:candito5_week/product/models/workout_model.dart';
import 'package:flutter/material.dart';

class CycleView extends StatefulWidget {
  const CycleView({super.key});

  @override
  State<CycleView> createState() => _CycleViewState();
}

class _CycleViewState extends State<CycleView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text('Cycle'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              (index + 1).toString(),
                            ),
                            Image.asset('assets/icons/circle_week.png'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Text(
              'Workouts Of This Cycle',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const Column(
              children: [
                WorkoutModel(
                  index: 0,
                ),
                WorkoutModel(
                  index: 1,
                ),
                WorkoutModel(
                  index: 2,
                ),
                WorkoutModel(
                  index: 3,
                ),
                WorkoutModel(
                  index: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
