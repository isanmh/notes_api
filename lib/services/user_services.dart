import 'dart:convert';

import 'package:notes_api/models/user_model.dart';
import 'package:notes_api/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<List<User>> getUser() async {
    final res = await http.get(Uri.parse(userUrl));
    if (res.statusCode == 200) {
      final result = jsonDecode(res.body);
      List<User> users = List<User>.from(
        result['data'].map(
          (user) => User.fromJson(user),
        ),
      );
      return users;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
