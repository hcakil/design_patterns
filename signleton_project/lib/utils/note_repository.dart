import '../models/note.dart';

//NOT THREAD SAFE OPERATION
/*
class NoteRepository {
  // The single instance of the repo
  static final NoteRepository _instance = NoteRepository._internal();

  // Private constructor to create a single instance
  NoteRepository._internal();

  // Factory constructor to return the single instance
  factory NoteRepository() {
    return _instance;
  }

  // List to store notes
  final List<Note> _notes = [];

  // Get all notes
  List<Note> getNotes() {
    return _notes;
  }

  // Add a new note
  void addNote(Note note) {
    _notes.add(note);
  }

  // Remove a note
  void removeNote(Note note) {
    _notes.remove(note);
  }
}*/

import 'package:synchronized/synchronized.dart'; 

class NoteRepository {
  static final NoteRepository _instance = NoteRepository._internal();
  final List<Note> _notes = [];
  final _lock = Lock();

  NoteRepository._internal();

  factory NoteRepository() {
    return _instance;
  }

  List<Note> getNotes() {
    return _notes;
  }

  void addNote(Note note) {
    _lock.synchronized(() {
      _notes.add(note);
    });
  }

  void editNote(Note editedNote) {
    _lock.synchronized(() {
      final index = _notes.indexWhere((note) => note.id == editedNote.id);
      if (index != -1) {
        _notes[index] = editedNote;
      }
    });
  }

  void removeNote(Note note) {
    _lock.synchronized(() {
      _notes.remove(note);
    });
  }
}


