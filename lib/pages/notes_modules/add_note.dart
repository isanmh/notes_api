import 'package:flutter/material.dart';
import 'package:notes_api/utils/constants.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  // validation
  bool validateTitle = false;
  bool validateContent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  errorText: validateTitle ? 'Title is required' : null,
                ),
                controller: titleController,
              ),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Content',
                  errorText: validateContent ? 'Content is required' : null,
                ),
                controller: contentController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () async {
                      setState(() {
                        titleController.text.isEmpty
                            ? validateTitle = true
                            : validateTitle = false;
                        contentController.text.isEmpty
                            ? validateContent = true
                            : validateContent = false;
                      });
                      if (validateTitle == false && validateContent == false) {
                        // add notes
                        // print('note added');
                        showSnackBar(context, 'Note added');
                      }
                    },
                    child: const Text('create'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
