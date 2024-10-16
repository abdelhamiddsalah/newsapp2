import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Core/Helper/Cache_helper.dart';
import 'package:newsapp/Features/Home/data/Enums/ThemeStates.dart';

part 'theme_cubit_state.dart';

class ThemeCubitCubit extends Cubit<ThemeCubitState> {
  ThemeCubitCubit() : super(ThemeCubitInitial());
  changeTheme(Themestates state){
    switch (state) {
      case Themestates.Initial:
      if(sharedPreferences!.getString('theme')!=null){
        if (sharedPreferences!.getString('theme')=='l') {
           emit(ThemeCubitLight());
        }else{
          emit(ThemeCubitDark());
        }
      }
        emit(ThemeCubitInitial());
        break;
      case Themestates.Light:
      sharedPreferences!.setString('theme', 'l');
        emit(ThemeCubitLight());
        break;
      case Themestates.Dark:
      sharedPreferences!.setString('theme', 'd');
        emit(ThemeCubitDark());
        break;
      default:
    }
  }

  void toggleTheme() {
    if (state is ThemeCubitLight) {
      sharedPreferences!.getString('theme');
      emit(ThemeCubitDark());
    } else {
      sharedPreferences!.getString('theme');
      emit(ThemeCubitLight());
    }
  }
}
