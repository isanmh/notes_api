// Snack Bar
import 'package:flutter/material.dart';

// url global
const String _baseurl = 'https://jsonplaceholder.typicode.com';
const String albumUrl = '/albums/1';
const String postUrl = '$_baseurl/posts';

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
