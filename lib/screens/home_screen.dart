import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../models/exercise.dart';
import 'exercise_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomeScreen({
    required this.isDarkMode,
    required this.toggleTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تمارين رياضية'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: CustomDrawer(
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: workoutCategories.length,
        itemBuilder: (context, index) {
          return WorkoutCard(
            category: workoutCategories[index],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExerciseList(category: workoutCategories[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget ExerciseList({required WorkoutCategory category}) {
  final List<Exercise> exercises = [
    if (category.name == 'تمارين الصدر') ...[
      Exercise(
        name: 'تمرين الضغط',
        description: 'تمرين أساسي لتقوية عضلات الصدر',
        steps: [
          'ابدأ في وضعية الانبطاح مع وضع يديك على الأرض',
          'باعد بين يديك بعرض الكتفين',
          'ادفع جسمك للأعلى مع الحفاظ على استقامة الظهر',
          'اخفض جسمك حتى يقترب صدرك من الأرض',
          'كرر الحركة'
        ],
        imageUrl: 'assets/pushup.jpg',
        recommendedSets: 3,
        recommendedReps: 12,
        tips: ['حافظ على استقامة ظهرك', 'تنفس بانتظام', 'اضبط سرعة الحركة'],
      ),
      Exercise(
        name: 'بنش بريس (Bench Press)',
        description: 'تمرين الضغط بالبار على مقعد مستوي',
        steps: [
          'استلق على مقعد مستوي',
          'امسك البار بقبضة أوسع من عرض الكتفين',
          'انزل البار ببطء نحو الصدر',
          'ادفع البار للأعلى مع الزفير',
          'كرر التمرين مع التحكم في الحركة'
        ],
        imageUrl: 'assets/bench_press.jpg',
        recommendedSets: 4,
        recommendedReps: 10,
        tips: [
          'حافظ على ثبات المقعد',
          'لا تقفل المرفقين بشكل كامل',
          'تنفس بشكل منتظم'
        ],
      ),
      Exercise(
        name: 'دمبل فلاي (Dumbbell Fly)',
        description: 'تمرين لتقوية وتوسيع عضلات الصدر',
        steps: [
          'استلق على مقعد مستوي مع حمل الدمبل',
          'ارفع الأوزان فوق صدرك مع ثني المرفقين قليلاً',
          'افتح ذراعيك إلى الجانبين ببطء',
          'ارجع إلى وضعية البداية',
          'كرر الحركة'
        ],
        imageUrl: 'assets/dumbbell_fly.jpg',
        recommendedSets: 3,
        recommendedReps: 12,
        tips: [
          'حافظ على ثني المرفقين قليلاً',
          'تحكم في سرعة النزول',
          'لا تنزل الأوزان أسفل مستوى الكتفين'
        ],
      ),
    ],
    if (category.name == 'تمارين البطن') ...[
      Exercise(
        name: 'تمرين البطن (Crunches)',
        description: 'تمرين فعال لتقوية عضلات البطن',
        steps: [
          'استلق على ظهرك',
          'اثني ركبتيك مع وضع قدميك على الأرض',
          'ضع يديك خلف رأسك',
          'ارفع كتفيك عن الأرض',
          'عد إلى وضعية البداية'
        ],
        imageUrl: 'assets/crunches.jpg',
        recommendedSets: 4,
        recommendedReps: 15,
        tips: ['لا تشد رقبتك', 'ركز على عضلات البطن', 'تنفس بانتظام'],
      ),
      // Add more abs exercises...
    ],
    if (category.name == 'تمارين الظهر') ...[
      Exercise(
        name: 'عتلة الظهر (Deadlift)',
        description: 'تمرين أساسي لتقوية عضلات الظهر والساقين',
        steps: [
          'قف أمام البار مع مباعدة القدمين بعرض الكتفين',
          'انحني للأمام مع ثني الركبتين وامسك البار',
          'ارفع البار مع فرد الظهر والساقين',
          'عد إلى وضعية البداية ببطء',
          'كرر الحركة'
        ],
        imageUrl: 'assets/deadlift.jpg',
        recommendedSets: 4,
        recommendedReps: 8,
        tips: [
          'حافظ على استقامة الظهر',
          'ابدأ بأوزان خفيفة',
          'لا تدور ظهرك أثناء الرفع'
        ],
      ),
      Exercise(
        name: 'سحب البار العلوي (Pull-ups)',
        description: 'تمرين لتقوية أعلى الظهر والذراعين',
        steps: [
          'امسك العقلة بقبضة عريضة',
          'اسحب جسمك للأعلى حتى يصل ذقنك فوق العقلة',
          'انزل ببطء إلى وضعية البداية',
          'كرر الحركة'
        ],
        imageUrl: 'assets/pullups.jpg',
        recommendedSets: 3,
        recommendedReps: 8,
        tips: ['استخدم قبضة مريحة', 'لا تتأرجح أثناء السحب', 'تنفس بانتظام'],
      ),
    ],
    if (category.name == 'تمارين الأثقال') ...[
      Exercise(
        name: 'كيرل البايسبس (Biceps Curl)',
        description: 'تمرين لتقوية عضلات الذراع الأمامية',
        steps: [
          'قف مع حمل الدمبل في كل يد',
          'اجعل ذراعيك بجانب جسمك',
          'ارفع الأوزان نحو كتفيك مع ثني المرفقين',
          'انزل ببطء إلى وضعية البداية',
          'كرر الحركة مع الحفاظ على ثبات المرفقين'
        ],
        imageUrl: 'assets/biceps_curl.jpg',
        recommendedSets: 4,
        recommendedReps: 12,
        tips: [
          'حافظ على ثبات المرفقين بجانب جسمك',
          'تجنب التأرجح للخلف',
          'تحكم في سرعة النزول'
        ],
      ),
      Exercise(
        name: 'رفع الكتف (Shoulder Press)',
        description: 'تمرين لتقوية عضلات الكتف',
        steps: [
          'قف مع حمل الدمبل على مستوى الكتفين',
          'ادفع الأوزان للأعلى فوق رأسك',
          'حافظ على استقامة الظهر',
          'انزل ببطء إلى وضعية البداية',
          'كرر الحركة'
        ],
        imageUrl: 'assets/shoulder_press.jpg',
        recommendedSets: 3,
        recommendedReps: 10,
        tips: [
          'لا تقفل المرفقين بشكل كامل',
          'حافظ على ثبات البطن',
          'تنفس بانتظام'
        ],
      ),
    ],
    if (category.name == 'تمارين القوة') ...[
      Exercise(
        name: 'القرفصاء (Squats)',
        description: 'تمرين أساسي لتقوية عضلات الساقين والجسم بالكامل',
        steps: [
          'قف مع وضع البار على الكتفين',
          'باعد قدميك بعرض الكتفين',
          'انزل ببطء مع ثني الركبتين',
          'حافظ على استقامة الظهر',
          'ارجع لوضعية الوقوف'
        ],
        imageUrl: 'assets/squats.jpg',
        recommendedSets: 4,
        recommendedReps: 8,
        tips: [
          'احرص على عمق مناسب',
          'اجعل ركبتيك في اتجاه أصابع قدميك',
          'ابدأ بوزن خفيف لإتقان الحركة'
        ],
      ),
      Exercise(
        name: 'الكلين والجيرك (Clean and Jerk)',
        description: 'تمرين قوة أولمبي متكامل',
        steps: [
          'قف أمام البار مع ثني الركبتين قليلاً',
          'اسحب البار بقوة نحو الصدر',
          'اهبط تحت البار مع استقباله على الكتفين',
          'ادفع البار فوق الرأس مع فتح الرجلين',
          'عد إلى وضعية الوقوف مع البار فوق الرأس'
        ],
        imageUrl: 'assets/clean_jerk.jpg',
        recommendedSets: 5,
        recommendedReps: 3,
        tips: [
          'ركز على التكنيك الصحيح',
          'حافظ على السرعة والقوة معاً',
          'تأكد من الإحماء الجيد'
        ],
      ),
      Exercise(
        name: 'الخطف (Snatch)',
        description: 'رفعة أولمبية تتطلب قوة وسرعة عالية',
        steps: [
          'قف أمام البار بوضعية البداية',
          'اسحب البار بحركة قوية وسريعة',
          'اهبط تحت البار مع رفعه فوق الرأس',
          'ثبت الوضعية مع البار فوق الرأس',
          'قف مع الحفاظ على البار فوق الرأس'
        ],
        imageUrl: 'assets/snatch.jpg',
        recommendedSets: 4,
        recommendedReps: 3,
        tips: [
          'ركز على المرونة والسرعة',
          'حافظ على مسار البار قريب من جسمك',
          'تأكد من الإحماء الجيد'
        ],
      ),
    ],
    // Add exercises for other categories...
  ];

  return Scaffold(
    appBar: AppBar(
      title: Text(category.name),
    ),
    body: ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(exercise.name),
            subtitle: Text(
                '${exercise.recommendedSets} مجموعات × ${exercise.recommendedReps} تكرار'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ExerciseDetailScreen(exercise: exercise),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}

class WorkoutCard extends StatelessWidget {
  final WorkoutCategory category;
  final VoidCallback onTap;

  const WorkoutCard({
    required this.category,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: category.color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category.icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutCategory {
  final String name;
  final IconData icon;
  final Color color;

  const WorkoutCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

final workoutCategories = [
  WorkoutCategory(
    name: 'تمارين الصدر',
    icon: Icons.fitness_center,
    color: Colors.blue,
  ),
  WorkoutCategory(
    name: 'تمارين البطن',
    icon: Icons.accessible,
    color: Colors.green,
  ),
  WorkoutCategory(
    name: 'تمارين الظهر',
    icon: Icons.sports_gymnastics,
    color: Colors.orange,
  ),
  WorkoutCategory(
    name: 'تمارين الساقين',
    icon: Icons.directions_run,
    color: Colors.purple,
  ),
  WorkoutCategory(
    name: 'تمارين الأثقال',
    icon: Icons.fitness_center,
    color: Colors.red,
  ),
  WorkoutCategory(
    name: 'تمارين القوة',
    icon: Icons.sports_martial_arts,
    color: Colors.brown,
  ),
];
