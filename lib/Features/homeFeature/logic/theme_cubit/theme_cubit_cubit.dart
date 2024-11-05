/*import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Core/enums/ThemeStates.dart';
import 'package:newsapp/Core/helper/Cache_helper.dart';

part 'theme_cubit_state.dart';

class ThemeCubitCubit extends Cubit<ThemeCubitState> {
  ThemeCubitCubit() : super(ThemeCubitInitial()) {
    _loadTheme();
  }

  void _loadTheme() {
    final theme = SharedPrefHelper.getString('theme');
    if (theme == 'l') {
      emit(ThemeCubitLight());
    } else if (theme == 'd') {
      emit(ThemeCubitDark());
    } else {
      emit(ThemeCubitInitial());
    }
  }

  void toggleTheme(Themestates state) {
    if (state == Themestates.Light) {
      SharedPrefHelper.setData('theme', 'l');
      emit(ThemeCubitLight());
    } else if (state == Themestates.Dark) {
      SharedPrefHelper.setData('theme', 'd');
      emit(ThemeCubitDark());
    }
  }
}*/
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:newsapp/Core/enums/ThemeStates.dart';

part 'theme_cubit_state.dart';

class ThemeCubitCubit extends Cubit<ThemeCubitState> {
  ThemeCubitCubit() : super(ThemeCubitInitial()) {
    _loadTheme();
  }

  final Box settingsBox = Hive.box('settingsBox');

  void _loadTheme() {
    final theme = settingsBox.get('theme', defaultValue: 'initial');
    if (theme == 'l') {
      emit(ThemeCubitLight());
    } else if (theme == 'd') {
      emit(ThemeCubitDark());
    } else {
      emit(ThemeCubitInitial());
    }
  }

  void toggleTheme(Themestates state) {
    if (state == Themestates.Light) {
      settingsBox.put('theme', 'l');
      emit(ThemeCubitLight());
    } else if (state == Themestates.Dark) {
      settingsBox.put('theme', 'd');
      emit(ThemeCubitDark());
    }
  }
}
