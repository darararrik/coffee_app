import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<bool> {
  static const String _themeKey = 'isDarkTheme';
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs) : super(_prefs.getBool(_themeKey) ?? false);

  void toggleTheme() {
    final isDark = !state;
    _prefs.setBool(_themeKey, isDark);
    emit(isDark);
  }

  bool get isDarkTheme => state;
}
