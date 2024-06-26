import 'package:flutter/material.dart';
import 'package:notes_api/models/note_model.dart';
import 'package:notes_api/services/note_services.dart';
import 'package:notes_api/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  NoteServices noteServices = NoteServices();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final data = await noteServices.getNotes();
    setState(() {
      isLoading = false;
      notes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.home),
        title: const Text('Notes App'),
        actions: [
          IconButton(
            onPressed: () {
              // tombol add
              Navigator.pushNamed(context, '/add');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // refresh data
          getData();
        },
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        note.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        note.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        color: Colors.red,
                        onPressed: () async {
                          // alert dialog
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete note'),
                                content: const Text('Are you sure?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await noteServices.deleteNote(
                                        note.id,
                                      );
                                      getData();
                                      Navigator.pop(context);
                                      showSnackBar(context, 'Note was deleted');
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      onTap: () {
                        // detail edit data & arguments
                        Navigator.pushNamed(
                          context,
                          '/edit',
                          arguments: [
                            // arguments data to edit
                            note.id,
                            note.title,
                            note.content,
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
