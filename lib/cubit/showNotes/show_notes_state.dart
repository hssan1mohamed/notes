part of 'show_notes_cubit.dart';

@immutable
abstract class ShowNotesState {}

class ShowNotesInitial extends ShowNotesState {}
class ShowNotesSuccess extends ShowNotesState {
  final List<Note> notes;
   ShowNotesSuccess({required this.notes});
}