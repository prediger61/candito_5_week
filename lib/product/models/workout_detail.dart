import 'package:flutter/material.dart';

class WorkoutDetail extends StatelessWidget {
  const WorkoutDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Wed, Jan 10'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Edit action
            },
          ),
        ],
      ),
      body: ListView(
        children: const [
          WorkoutListItem(title: 'Squat', repCount: 12, weight: 100),
          WorkoutListItem(title: 'Bench Press', repCount: 10, weight: 90),
          WorkoutListItem(title: 'Deadlift', repCount: 8, weight: 110),
        ],
      ),
    );
  }
}

class WorkoutListItem extends StatelessWidget {
  const WorkoutListItem({
    required this.title,
    required this.repCount,
    required this.weight,
    super.key,
  });
  final String title;
  final int repCount;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.fitness_center, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '$repCount Rep',
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(201, 252, 110, 45),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '$weight KG',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
