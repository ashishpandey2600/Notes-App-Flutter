import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import '../models/note.dart';

Client client = Client();

class ApiService {
  Databases databases = Databases(client);

  addNote(Note note) async {
    client
            .setEndpoint(
                'https://10.0.2.2/v1') // Make sure your endpoint is accessible from your emulator, use IP if needed
            .setProject('64230b300e43459d4c75') // Your project ID
            .setSelfSigned() // Do not use this in production
        ;

    try {
      await databases.createDocument(
        databaseId: '64318abae6dd855eb2e9', //notesappfinal 64246ac88814a102e971
        collectionId: '64318ac2a6ad115cd682',
        documentId: note.id,
        data: {
          "title": note.title,
          "content": note.content,
          "dateadded": note.dateadded.toIso8601String(),
          "userid": note.userid.toString()
        },
      );
      print("database created");
      return true;
    } catch (e) {
      rethrow;
    }
  }

  updateDocument(Note note) async {
    try {
      databases.updateDocument(
          databaseId: '64318abae6dd855eb2e9',
          collectionId: '64318ac2a6ad115cd682',
          documentId: note.id,
          data: {
            "title": note.title,
            "content": note.content,
            "dateadded": note.dateadded.toIso8601String(),
            "userid": note.userid.toString()
          });
    } catch (e) {
      rethrow;
    }
  }

  deleteDoc(String id) {
    try {
      databases.deleteDocument(
          databaseId: '64318abae6dd855eb2e9',
          collectionId: '64318ac2a6ad115cd682',
          documentId: id);
    } catch (e) {
      rethrow;
    }
  }

//Todo complete fetch data(getDocuments) function
  Future<List<Document>> getDocuments() async {
    try {
      // Get a list of all documents in the collection
      final response = await databases.listDocuments(
          databaseId: '64318abae6dd855eb2e9',//64318abae6dd855eb2e9
          collectionId: '64318ac2a6ad115cd682');//64318ac2a6ad115cd682
      print(response);
      // Return the list of documents
      return List<Map<String, dynamic>>.from(response.documents)
          .map((e) => Document.fromMap(e))
          .toList();
    } catch (e) {
      print(e.toString());
      return []; // return an empty list if there's an error
    }
  }
}
