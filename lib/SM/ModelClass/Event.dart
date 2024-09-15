class Event {
  final String title;
  final String imagePath; // Changed from imageUrl to imagePath
  final String location;
  final String dateTime;

  Event({
    required this.title,
    required this.imagePath,
    required this.location,
    required this.dateTime,
  });
}