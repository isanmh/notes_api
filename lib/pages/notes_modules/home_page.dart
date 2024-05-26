import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        },
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  'Flutter training',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: Text('Calling notes api'),
                trailing: IconButton(
                  color: Colors.red,
                  onPressed: () async {
                    // alert dialog
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Delete note'),
                          content: Text('Are you sure?'),
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
                                // delete data
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
                      '1',
                      'Flutter training',
                      'Calling notes api',
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
