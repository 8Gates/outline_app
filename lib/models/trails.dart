class Trails{
  final int id;
  final String name;
  final String description;
  final double distance;
  final double elevationGain;
  final String difficulty;
  final List location;

  const Trails({
    required this.id, 
    required this.name, 
    required this.description,
    required this.distance, 
    required this.elevationGain,
    required this.difficulty,
    required this.location
  });
}
