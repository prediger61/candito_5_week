import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:candito5_week/product/models/workout_detail.dart';
import 'package:flutter/material.dart';

class WorkoutModel extends StatelessWidget {
  const WorkoutModel({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const WorkoutDetail();
            },
          ),
        );
      },
      child: Container(
        width: 1050,
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: ColorConstants.systemBlackDark,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Image.asset('assets/icons/logo1.png'),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Strenght Workout',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      index.isEven ? 'Lower' : 'Upper',
                      style: const TextStyle(
                        color: ColorConstants.appMainColor,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 140),
                    const Text('9/8/23>'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
