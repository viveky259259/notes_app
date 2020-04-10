import 'package:flutter/material.dart';
import 'package:pass_list/models/note.dart';
import 'package:pass_list/utils/database_helper.dart';

// https://stackoverflow.com/a/56713184
class NoteProvider with ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();
  static NoteProvider noteProvider;
  List<Note> _noteList = [];
  int count = 0;

  // get updateListView;

  get noteList => _noteList;

  static NoteProvider getInstance() {
    if (noteProvider == null) noteProvider = NoteProvider();
    return noteProvider..fetchNotes();
  }

  void setNoteList(notesList) {
    _noteList = notesList;
    print('noteList: ${notesList.length}');
  }

  fetchNotes() async {
    await databaseHelper.initializeDatabase();
    List<Note> noteList = await databaseHelper.getNoteList();
    setNoteList(noteList);
  }

  Future<int> updateNote(note) async {
    var result = await databaseHelper.updateNote(note);
    await fetchNotes();
    notifyListeners();
    return result;
  }

  Future<int> insertNote(note) async {
    var result = await databaseHelper.insertNote(note);
    await fetchNotes();
    notifyListeners();
    return result;
  }

  Future<int> deleteNote(noteId) async {
    var result = await databaseHelper.deleteNote(noteId);
    await fetchNotes();
    notifyListeners();
    return result;
  }
}
