import 'dart:convert';

import 'package:notes_api/models/note_model.dart';
import 'package:notes_api/utils/constants.dart';
import 'package:http/http.dart' as http;

class NoteServices {
  // get
  Future getNotes() async {
    try {
      final res = await http.get(Uri.parse(notesUrl));
      if (res.statusCode == 200) {
        Iterable it = jsonDecode(res.body);
        List<Note> notes = it.map((e) => Note.fromJson(e)).toList();
        return notes;
      } else {
        return "Error";
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // post
  Future postNote(String title, String content) async {
    try {
      final res = await http.post(
        Uri.parse(notesUrl),
        body: {
          "title": title,
          "content": content,
        },
      );
      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // put
  Future putNote(int id, String title, String content) async {
    try {
      final res = await http.put(
        Uri.parse('$notesUrl/${id.toString()}'),
        body: {
          "title": title,
          "content": content,
        },
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // delete
  Future deleteNote(String id) async {
    try {
      final res = await http.delete(
        Uri.parse('$notesUrl/${id.toString()}'),
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
