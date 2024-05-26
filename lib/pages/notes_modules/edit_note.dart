import 'package:flutter/material.dart';
import 'package:notes_api/utils/constants.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  // validation
  bool validateTitle = false;
  bool validateContent = false;

  @override
  Widget build(BuildContext context) {
    // get data args
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    if (args.isNotEmpty) {
      titleController.text = args[1];
      contentController.text = args[2];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data Blog'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Title',
                errorText: validateTitle ? 'Title is required' : null,
              ),
              controller: titleController,
            ),
            TextFormField(
              maxLines: 5,
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
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
                      // edit data
                      showSnackBar(context, 'Data updated');
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
