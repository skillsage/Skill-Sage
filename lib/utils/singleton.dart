part of skillsage_utils;

class Singleton {
  static List<ChangeNotifierProvider> registerProviders() {
    return [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ];
  }
}
