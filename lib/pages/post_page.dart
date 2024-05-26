import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> items = ['item 1', 'item 2', 'item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.article_outlined),
        title: const Text('All News'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // refresh data
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < items.length) {
              final item = items[index];
              return Card(
                child: ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  subtitle: const Text(
                    'ihsan@gmail.com',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      item[0],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
