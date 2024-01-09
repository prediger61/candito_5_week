import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:flutter/material.dart';

class WorkoutModel extends StatelessWidget {
  const WorkoutModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1050,
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          color: ColorConstants.systemBlackDark,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset('assets/icons/logo1.png'),
          SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Strenght Workout',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Upper',
                    style: TextStyle(
                      color: ColorConstants.appMainColor,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(width: 140),
                  Text('9/8/23>'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
