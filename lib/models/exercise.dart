class Exercise {
  final String name;
  final String description;
  final List<String> steps;
  final String imageUrl;
  final int recommendedSets;
  final int recommendedReps;
  final List<String> tips;

  Exercise({
    required this.name,
    required this.description,
    required this.steps,
    required this.imageUrl,
    required this.recommendedSets,
    required this.recommendedReps,
    required this.tips,
  });
}
