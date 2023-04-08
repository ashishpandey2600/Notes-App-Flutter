import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/add_new_note.dart';
import 'package:notesapp/providers/notes_provider.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NotesProvider notesProvider = Provider.of<NotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
        centerTitle: true,
      ),
      body: (notesProvider.notes.length > 0)
          ? SafeArea(
              child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: notesProvider.notes.length,
              itemBuilder: (context, index) {
                Note currentNote = notesProvider.notes[index];

                return GestureDetector(
                  onTap: () {
                    //Updates

                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AddNewPage(
                                  isUpdate: true,
                                  note: currentNote,
                                )));
                  },
                  onLongPress: () {
                    //Delete
                    notesProvider.deleteNote(currentNote);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2)),
                    padding: EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentNote.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            currentNote.content,
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                  ),
                );
              },
            ))
          : Center(
              child: Text("No Notes yet"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => AddNewPage(
                        isUpdate: false,
                      )));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
