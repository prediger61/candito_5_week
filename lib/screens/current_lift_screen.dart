import 'package:candito5_week/product/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LiftType {
  squat('Squat'),
  bench('Bench'),
  deadlift('Deadlift');

  final String value;
  const LiftType(this.value);
}

class CurrentLiftScreen extends StatefulWidget {
  const CurrentLiftScreen({
    required this.liftType,
    required this.pageController,
    super.key,
  });
  final LiftType liftType;
  final PageController pageController;

  @override
  _CurrentLiftScreenState createState() => _CurrentLiftScreenState();
}

class _CurrentLiftScreenState extends State<CurrentLiftScreen> {
  ValueNotifier<int> maxWeight = ValueNotifier<int>(150);
  late final UserProvider userModel;
  void updateMaxWeight(UserProvider userModel, int weight) {
    switch (widget.liftType) {
      case LiftType.squat:
        userModel.squat = weight;
      case LiftType.bench:
        userModel.bench = weight;
      case LiftType.deadlift:
        userModel.deadlift = weight;
    }
    userModel.saveData();
  }

  Future<void> loadData() async {
    userModel = Provider.of<UserProvider>(context, listen: false);
    await userModel.loadData();
    switch (widget.liftType) {
      case LiftType.squat:
        maxWeight.value = userModel.squat;
      case LiftType.bench:
        maxWeight.value = userModel.bench;
      case LiftType.deadlift:
        maxWeight.value = userModel.deadlift;
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: maxWeight,
        builder: (context, _, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CURRENT ${widget.liftType.value.toUpperCase()} 1RM MAX',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(
                'A 1RM refers to the maximum amount of weight you can lift for one repetition of a given exercise.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: 'decrement',
                    onPressed: () {
                      maxWeight.value--;
                    },
                    child: const Icon(Icons.remove),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        '${maxWeight.value} KG',
                        style: const TextStyle(fontSize: 48),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'increment',
                    onPressed: () {
                      maxWeight.value++;
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  updateMaxWeight(userModel, maxWeight.value);
                  final currentIndex = LiftType.values.indexOf(widget.liftType);
                  final nextIndex = (currentIndex + 1) % LiftType.values.length;
                  widget.pageController.animateToPage(
                    nextIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text('Set Max'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Done'),
              ),
            ],
          );
        },
      ),
    );
  }
}
