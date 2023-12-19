import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubit/showNotes/show_notes_cubit.dart';
import 'package:note_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubit/theme_cubit/theme_cubit.dart';
import 'models/note.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes_box');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
          ),
          BlocProvider<AddNoteCubit>(
            create: (BuildContext context) => AddNoteCubit(),
          ),
          BlocProvider<ShowNotesCubit>(
            create: (BuildContext context) => ShowNotesCubit(),
          ),
        ],
        child: Builder(builder: (context) {
          return BlocConsumer<ThemeCubit, ThemeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                darkTheme: ThemeData.dark(),
                themeMode:
                    state is ThemeInitial ? ThemeMode.dark : state is ThemeDark?ThemeMode.dark: ThemeMode.light,
                home: const HomeScreen(),
              );
            },
          );
        }));
  }
}
