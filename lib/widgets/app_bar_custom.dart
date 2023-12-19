import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custm_icon.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Notes',
          style: TextStyle(fontSize: 30,),
        ),
        CustomIcon(
          icon: Icons.dark_mode_outlined,
          function: ()async {
            BlocProvider.of<ThemeCubit>(context).change_theme();


          },
        ),

      ],
    );
  }
}
