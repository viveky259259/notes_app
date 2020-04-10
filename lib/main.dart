import 'package:flutter/material.dart';
import 'package:pass_list/screens/note_list.dart';
import 'package:pass_list/utils/NoteProvider.dart';
import 'package:provider/provider.dart';

import 'utils/NoteProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (context) => NoteProvider.getInstance(),
      child: LayoutBuilder(
        builder: (context, constraint) {
          print(111111);
          return MaterialApp(
            title: 'Note List Manager',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.deepPurple),
            home: NoteList(),
            // home: NoteDetail(),
          );
        },
      ),
    );
  }
}
