import 'package:uuid/uuid.dart'; // Import the uuid package

class Note {
  final String id; // Unique identifier for each note
  final String title;
  final String content;

  Note({String? id, required this.title, required this.content})
      : id = id ?? const Uuid().v4(); // Generate a unique ID if not provided
}
