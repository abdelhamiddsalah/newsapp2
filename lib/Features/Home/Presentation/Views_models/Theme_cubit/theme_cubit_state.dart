part of 'theme_cubit_cubit.dart';

@immutable
sealed class ThemeCubitState {}

final class ThemeCubitInitial extends ThemeCubitState {}
final class ThemeCubitLight extends ThemeCubitState {}
final class ThemeCubitDark extends ThemeCubitState {}