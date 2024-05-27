import 'package:flutter/material.dart';
import 'package:notes_api/models/user_model.dart';
import 'package:notes_api/services/user_services.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoading = true;
  List<User> users = []; // data kosong dari model
  UserServices userServices = UserServices();
  // show
  show() async {
    final data = await userServices.getUser();
    setState(() {
      users = data; // replace data kosong dengan data dari model
      isLoading = false;
    });
  }

  @override
  void initState() {
    show();
    super.initState();
  }

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
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return ListTile(
                                title: Text(user.first_name),
                                subtitle: Text(user.email),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    user.avatar,
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
