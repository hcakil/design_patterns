import 'package:uuid/uuid.dart'; 

class Note {
  final String id; 
  final String title;
  final String content;

  Note({String? id, required this.title, required this.content})
      : id = id ?? const Uuid().v4(); 
}
