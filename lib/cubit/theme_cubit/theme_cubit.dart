// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);
  bool darkThem = true;
  void change_theme() async {
    darkThem = !darkThem;

    if (darkThem == true) {
      emit(ThemeDark());

    } else {
      emit(ThemeLight());
    }
  }
}
