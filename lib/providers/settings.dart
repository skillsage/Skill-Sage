part of skillsage_providers;

enum ThemeModeOption {
  light,
  dark,
}

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());

class ThemeProvider with ChangeNotifier {
  final _themeKey = 'theme';

  ThemeModeOption _themeMode = ThemeModeOption.light;

  ThemeModeOption get themeMode => _themeMode;

  ThemeProvider() {
    _initTheme();
  }

  Future<void> _initTheme() async {
    final p = await SharedPreferences.getInstance();
    final savedTheme = p.getString(_themeKey);
    if (savedTheme == null) {
      _themeMode = ThemeModeOption.light;
    } else {
      _themeMode = ThemeModeOption.values.firstWhere(
        (mode) => mode.toString() == savedTheme,
        orElse: () => ThemeModeOption.light,
      );
    }
    notifyListeners();
  }

  Future<void> setTheme(theme) async {
    _themeMode = theme;
    notifyListeners();
    final p = await SharedPreferences.getInstance();
    p.setString(_themeKey, _themeMode.toString());
    print(_themeMode);
  }

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeModeOption.light
        ? ThemeModeOption.dark
        : ThemeModeOption.light;
    setTheme(_themeMode);
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
