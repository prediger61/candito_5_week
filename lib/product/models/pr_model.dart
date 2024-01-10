import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:candito5_week/product/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrModel extends StatefulWidget {
  const PrModel({super.key});

  @override
  State<PrModel> createState() => _PrModelState();
}

class _PrModelState extends State<PrModel> {
  late int squat;
  late int bench;
  late int deadlift;

  @override
  void initState() {
    final userModel = Provider.of<UserProvider>(context, listen: false);
    squat = userModel.squat;
    bench = userModel.bench;
    deadlift = userModel.deadlift;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: ColorConstants.systemBlackDark,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Deadlift',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                deadlift.toString(),
                style: const TextStyle(fontSize: 24, color: Color(0xffD34657)),
              ),
              const Text(
                'Bench Press',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                bench.toString(),
                style: const TextStyle(fontSize: 24, color: Color(0xffD34657)),
              ),
              const Text(
                'Squat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                squat.toString(),
                style: const TextStyle(fontSize: 24, color: Color(0xffD34657)),
              ),
            ],
          ),
          const SizedBox(
            width: 100,
          ),
          Image.asset('assets/icons/Circle.png'),
        ],
      ),
    );
  }
}
