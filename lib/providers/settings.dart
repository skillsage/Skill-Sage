part of skillsage_providers;

enum ThemeModeOption {
  light,
  dark,
}

class ThemeProvider with ChangeNotifier {
  ThemeModeOption _themeMode = ThemeModeOption.light;

  ThemeModeOption get themeMode => _themeMode;

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeModeOption.light
        ? ThemeModeOption.dark
        : ThemeModeOption.light;
    notifyListeners();
  }

  ThemeData getThemeData(BuildContext context) {
    if (_themeMode == ThemeModeOption.light) {
      return ThemeData.light();
    } else {
      return ThemeData.dark();
    }
  }
}

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');

  Locale get locale => _locale;

  Future<void> setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;
    _locale = newLocale;
    // implement App Localization logic here
    notifyListeners();
  }
}
