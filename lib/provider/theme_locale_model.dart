import 'package:flutter/material.dart';
import 'package:simple_code_shop/constants/app_colors.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';
import 'package:simple_code_shop/generated/l10n.dart';

class ThemeLocaleModel with ChangeNotifier{
  bool _isDark = false;
  SettingsRepository _repository = SettingsRepository();
  bool get isDark => _isDark;

  ThemeLocaleModel(){
    _isDark = false;
    _repository = SettingsRepository();
    getPreferences();
  }

  getPreferences()async{
    _isDark = await _repository.getTheme();
    notifyListeners();
  }
  set isDark(bool value){
    _isDark = value;
    _repository.setTheme(value);
    notifyListeners();
  }

  changeLocale(String locale) async{
    if (locale == 'ru_RU') {
      await S.load(
        const Locale('ru', 'RU'),
      );
    } else if (locale == 'en') {
      await S.load(
        const Locale('en'),
      );
    }
    notifyListeners();
  }
}

class ThemeColor {
  static final darkTheme = ThemeData(  
    scaffoldBackgroundColor: AppColors.main,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black), 
  );

  static final lightTheme = ThemeData(  
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.main),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppColors.main), 
  );

}