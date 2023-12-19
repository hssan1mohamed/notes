import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/models/note.dart';
import '../constants/colors.dart';
import '../screens/edit.dart';

class CardItemWidget extends StatelessWidget {
  final Note note;
  const CardItemWidget({
    super.key,
    required this.note,
  });
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: getRandomColor(),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => EditScreen(note: note)),
            );
          },
          title: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: '${note.title} \n',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.5),
                children: [
                  TextSpan(
                    text: note.content,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        height: 1.5),
                  )
                ]),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(note.modifiedTime)}',
              style: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade800),
            ),
          ),
          trailing: IconButton(
            onPressed: () async {
              note.delete();
              BlocProvider.of<ShowNotesCubit>(context).fetchAllNote();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('deleted success')));
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
