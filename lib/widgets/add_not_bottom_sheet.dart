import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/widgets/text_input_widget.dart';

import '../cubit/add_note_cubit/add_note_cubit.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextInputWidget(
                controller: _title,
                hintText: 'title',
                maxLines: 1,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Title';
                  }
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            TextInputWidget(
                controller: content,
                hintText: 'Content',
                maxLines: 5,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Content';
                  }
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.black87,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AddNoteCubit().addNote(Note(
                          title: _title.text,
                          content: content.text,
                          modifiedTime: DateTime.now()));
                      BlocProvider.of<ShowNotesCubit>(context).fetchAllNote();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added success')));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 25),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
