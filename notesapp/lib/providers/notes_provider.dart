import 'package:flutter/material.dart';

import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  List<Note> notes = []; //list of class instances
  //which we have created using are model in UI(controller)

  void addNote(Note note) {
    notes.add(note);
    // Call API SAVE funtion
    notifyListeners();
  }

  void updateNote(Note note) {
    int indexOfNote =
        notes.indexOf(
          notes.firstWhere(
            (element) => element.id == note.id));
    notes[indexOfNote] = note;
    notifyListeners();
  }

  void deleteNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    notifyListeners();
   
  }
}
