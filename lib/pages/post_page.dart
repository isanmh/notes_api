import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_api/utils/constants.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> items = ['item 1', 'item 2', 'item 3'];
  // data from api
  List posts = [];
  int page = 1;
  int limit = 15;
  // key scroll
  final sController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
    sController.addListener(scrollListener);
  }

  Future getData() async {
    final url = '$postUrl?_limit=$limit&_page=$page';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final data = json.decode(res.body) as List;
      // print(data);
      setState(() {
        posts = posts + data;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  // scroll listener
  Future<void> scrollListener() async {
    if (sController.position.pixels == sController.position.maxScrollExtent) {
      print('end of page');
      setState(() {
        isLoading = true;
      });
      page++;
      await getData();
      setState(() {
        isLoading = false;
      });
    }
  }

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
          controller: sController,
          padding: const EdgeInsets.all(10),
          itemCount: isLoading ? posts.length + 1 : posts.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < posts.length) {
              final post = posts[index];
              return Card(
                child: ListTile(
                  title: Text(
                    post['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    post['body'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      post['id'].toString(),
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
