import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.person),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // refresh data
                    },
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Ihsan Miftahul Huda'),
                          subtitle: Text('isan@gmail.com'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://reqres.in/img/faces/5-image.jpg',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
