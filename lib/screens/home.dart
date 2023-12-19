import 'package:flutter/material.dart';
import 'package:note_app/widgets/list_widget.dart';
import '../widgets/add_not_bottom_sheet.dart';
import '../widgets/app_bar_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            AppBarCustom(),
            // const SizedBox(height: 20),
            // TextFiledWidget(onChanged: (v) {}),
            SizedBox(height: 20),
            ListWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            builder: (BuildContext context) {
              return  Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),
                child: const AddNoteBottomSheet(),
              );
            },
          );
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,color: Colors.white,
          size: 38,
        ),
      ),
    );
  }
}
