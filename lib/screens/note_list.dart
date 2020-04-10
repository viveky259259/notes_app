import 'package:flutter/material.dart';
import 'package:pass_list/models/note.dart';
import 'package:pass_list/screens/note_detail.dart';
import 'package:pass_list/utils/NoteProvider.dart';
import 'package:provider/provider.dart';

import '../utils/NoteProvider.dart';

class NoteList extends StatelessWidget {
  Widget build(BuildContext context) {
    print('building');
    print(Provider.of<NoteProvider>(context).noteList.length);

    return Scaffold(
      appBar: AppBar(
        title: Text("Note List"),
      ),
      body: getnoteListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NoteDetail(Note('', '', 2), 'Add Note');
          }));
        },
        tooltip: "Add Note",
        child: Icon(Icons.add)
      ),
    );
  }

  ListView getnoteListView(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    var noteList = noteProvider.noteList;
    var count = noteList.length;
    print('count $count');
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        print(noteList[index].title);
        return Text(
          noteList[index].title,
          style: titleStyle,
        );
      },
    );
  }
}
