import 'package:flutter/material.dart';
import 'package:notes_api/pages/menu_page.dart';
import 'package:notes_api/pages/notes_modules/add_note.dart';
import 'package:notes_api/pages/notes_modules/edit_note.dart';
import 'package:notes_api/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/menu': (context) => const MenuPage(),
          '/add': (context) => AddNote(),
          '/edit': (context) => EditNote(),
        },
      ),
    );
  }
}
