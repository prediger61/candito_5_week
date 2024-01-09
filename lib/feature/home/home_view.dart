import 'package:candito5_week/product/constants/color_constants.dart';
import 'package:candito5_week/product/models/pr_model.dart';
import 'package:candito5_week/product/models/workout_model.dart';
import 'package:candito5_week/screens/cycle_view.dart';
import 'package:candito5_week/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  final PageController pageController;
  final ValueNotifier<int> index;
  const HomeView(
      {super.key, required this.index, required this.pageController});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              const Text(
                '9 Nisan 2023',
                style:
                    TextStyle(color: ColorConstants.systemGray, fontSize: 12),
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const Text(
                'Current Maxes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              PrModel(),
              Row(
                children: [
                  Spacer(),
                  Text('Workouts Of This Week',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  Spacer(),
                  TextButton(
                    child: Text('Show More',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: ColorConstants.appMainColor)),
                    onPressed: () {
                      widget.index.value = 0;
                      widget.pageController.jumpTo(0);
                    },
                  ),
                  Spacer(),
                ],
              ),
              const WorkoutModel(),
              const WorkoutModel(),
              Container(
                margin: EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: ColorConstants.systemBlackDark,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10))),
                child: Center(
                  child: Column(
                    children: [
                      Text('Tips'),
                      Container(
                        child: Column(
                          children: [
                            Image.asset('assets/icons/Illu.png'),
                            Text(
                                'Show MoreShow MoreShow MoreShow MoreShow MoreShow MoreShow MoreShow MoreShow MoreShow MoreShow s'),
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
