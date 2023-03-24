import 'package:flutter/material.dart';
import 'package:notesapp/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/note.dart';

class AddNewPage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNewPage({super.key, required this.isUpdate, this.note});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  FocusNode noteFocus = FocusNode();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  void addNewNote() {
    Note newNote = Note(
      id: const Uuid().v1(),
      userid: "Ashish Pandey",
      title: titleController.text,
      content: contentController.text,
      dateadded: DateTime.now(),
    );
    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  void updateNote() {
    widget.note!.title = titleController.text;
    widget.note!.content = contentController.text;
    Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isUpdate) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write notes"),
        actions: [
          IconButton(
              onPressed: () {
                if (widget.isUpdate) {
                  //update
                  updateNote();
                } else {
                  addNewNote();
                }
              },
              icon: const Icon(Icons.check)),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: titleController,
            autofocus: (widget.isUpdate == true) ? false : true,
            onSubmitted: (value) {
              if (value != "") {
                noteFocus.requestFocus();
              }
            },
            style: TextStyle(fontSize: 20),
            decoration:
                InputDecoration(border: InputBorder.none, hintText: "Title"),
          ),
          Expanded(
            child: TextField(
              controller: contentController,
              focusNode: noteFocus,
              maxLines: null,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "write something"),
            ),
          )
        ],
      )),
    );
  }
}
