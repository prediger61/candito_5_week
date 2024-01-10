import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:candito5_week/product/models/pr_model.dart';
import 'package:candito5_week/product/models/workout_model.dart';
import 'package:candito5_week/screens/cycle_view.dart';
import 'package:candito5_week/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    required this.index,
    required this.pageController,
    super.key,
  });
  final PageController pageController;
  final ValueNotifier<int> index;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const Text(
                'Current Maxes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const PrModel(),
              Row(
                children: [
                  const Spacer(),
                  const Text(
                    'Workouts Of This Week',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: ColorConstants.appMainColor,
                      ),
                    ),
                    onPressed: () {
                      widget.index.value = 0;
                      widget.pageController.jumpTo(0);
                    },
                  ),
                  const Spacer(),
                ],
              ),
              const WorkoutModel(
                index: 0,
              ),
              const WorkoutModel(
                index: 1,
              ),
              Container(
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: ColorConstants.systemBlackDark,
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const Text('Tips'),
                      Container(
                        child: Column(
                          children: [
                            Image.asset('assets/icons/Illu.png'),
                            const Text(
                              ' Proper form is crucial for both safety and performance. Take the time to learn and practice the correct technique for each of the three powerlifting lifts: squat, bench press, and deadlift. Consider working with a coach or experienced lifter to ensure your form is on point.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
