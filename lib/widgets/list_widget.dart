import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/models/note.dart';

import 'card_item_widget.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowNotesCubit>(context).fetchAllNote();
    return BlocConsumer<ShowNotesCubit, ShowNotesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List <Note>notes= BlocProvider.of<ShowNotesCubit>(context).all_notes ??[];
        return Expanded(
            child:notes==[]||notes.isEmpty?const Center(child: Text('No Notes',style: TextStyle(fontSize: 20),)) :ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount:notes.length,
              itemBuilder: (context, index) {
                return CardItemWidget(
                  note: notes[index]
                );
              },
            ));
      },
    );
  }
}
