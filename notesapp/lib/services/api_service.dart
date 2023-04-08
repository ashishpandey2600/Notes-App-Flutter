import '../models/note.dart';

class ApiService {
  static String _baseUrl = "";

  void addNote(Note note) {
    Uri requestUri = Uri.parse(_baseUrl + "/add");
    
  }
}
