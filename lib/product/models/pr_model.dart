import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:flutter/material.dart';

class PrModel extends StatefulWidget {
  const PrModel({super.key});

  @override
  State<PrModel> createState() => _PrModelState();
}

class _PrModelState extends State<PrModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          color: ColorConstants.systemBlackDark,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deadlift',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                '200',
                style: TextStyle(fontSize: 24, color: Color(0xffD34657)),
              ),
              Text(
                'Bench Press',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '200',
                style: TextStyle(fontSize: 24, color: Color(0xffD34657)),
              ),
              Text(
                'Squat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '200',
                style: TextStyle(fontSize: 24, color: Color(0xffD34657)),
              ),
            ],
          ),
          SizedBox(
            width: 100,
          ),
          Image.asset('assets/icons/Circle.png'),
        ],
      ),
    );
  }
}
