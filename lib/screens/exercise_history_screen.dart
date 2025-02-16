import 'package:flutter/material.dart';
import '../models/exercise_record.dart';

class ExerciseHistoryScreen extends StatelessWidget {
  ExerciseHistoryScreen({super.key});

  final List<ExerciseRecord> exerciseHistory = [
    ExerciseRecord(
      name: 'تمرين الضغط',
      date: DateTime.now().subtract(const Duration(days: 1)),
      sets: 3,
      reps: 12,
      category: 'تمارين الصدر',
    ),
    ExerciseRecord(
      name: 'Crunches',
      date: DateTime.now().subtract(const Duration(days: 1)),
      sets: 4,
      reps: 15,
      category: 'تمارين البطن',
    ),
    // Add more exercise records as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سجل التمارين'),
      ),
      body: ListView.builder(
        itemCount: exerciseHistory.length,
        itemBuilder: (context, index) {
          final exercise = exerciseHistory[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(exercise.name),
              subtitle: Text(
                '${exercise.sets} مجموعات × ${exercise.reps} تكرار\n${exercise.category}',
              ),
              trailing: Text(
                '${exercise.date.day}/${exercise.date.month}/${exercise.date.year}',
              ),
            ),
          );
        },
      ),
    );
  }
}
