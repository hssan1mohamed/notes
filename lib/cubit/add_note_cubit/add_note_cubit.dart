import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import '../../models/note.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(Note note) async {
    emit(AddNoteLoading());
    var notesBox = Hive.box<Note>('notes_box');
    await notesBox.add(note).then((value) => ShowNotesCubit().fetchAllNote());

    emit(AddNoteError());
  }
}
