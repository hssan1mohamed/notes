import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../models/note.dart';

part 'show_notes_state.dart';

class ShowNotesCubit extends Cubit<ShowNotesState> {
  ShowNotesCubit() : super(ShowNotesInitial());
  List<Note> ? all_notes;
  fetchAllNote() {
       var noteBox = Hive.box<Note>('notes_box');
       all_notes = noteBox.values.toList();
       emit(ShowNotesSuccess(notes: all_notes!));

  }
}
