
import 'package:flutter/material.dart';
class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon,required this.function});
final IconData icon;
final void Function()? function;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function,
          // setState(() {
          //   filteredNotes = sortNotesByModifiedTime(filteredNotes);
          // });

        padding: const EdgeInsets.all(0),
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(.8),
              borderRadius: BorderRadius.circular(10)),
          child:  Icon(
           icon,
            color: Colors.white,
          ),
        ));
  }
}
