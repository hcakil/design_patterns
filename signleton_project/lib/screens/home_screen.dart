import 'package:flutter/material.dart';
import 'package:signleton_project/screens/edit_screen.dart';
import '../models/note.dart';
import '../utils/note_repository.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NoteRepository _noteRepository = NoteRepository();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Taking App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
         _addNote();
            },
            child: const Text('Add Note'),
          ),
              Expanded(
            child: ListView.builder(
              itemCount: _noteRepository.getNotes().length,
              itemBuilder: (context, index) {
                final note = _noteRepository.getNotes()[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(note);
                    },
                  ),
                  onTap: () {
                    _navigateToEditScreen(note);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );}

void _addNote() {
  final title = _titleController.text;
  final content = _contentController.text;
  final note = Note(title: title, content: content); // Note now includes a unique ID
  _noteRepository.addNote(note);
  setState(() {
    _titleController.clear();
    _contentController.clear();
  });
}


  void _navigateToEditScreen(Note note) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditScreen(note: note),
      ),
    );
  }

      Future<void> _showDeleteConfirmationDialog(Note note) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Note'),
          content: Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
        if (confirmed == true) {
      _noteRepository.removeNote(note);
      setState(() {}); // Update the UI after deleting the note
    }
  }


  }

