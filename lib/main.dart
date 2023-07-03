import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:skill_sage_app/providers/_index.dart';
import 'package:skill_sage_app/utils/_index.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const SkillSage(),
      ),
    );

class SkillSage extends StatelessWidget {
  const SkillSage({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = context.read<ThemeProvider>();
    // remove consumer
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) => MaterialApp(
        title: 'Skill Sage',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
          Locale('fr', 'FR')
        ],
        locale: const Locale('en', 'US'),
        theme: ThemeData(
            brightness: themeProvider.themeMode == ThemeModeOption.light
                ? Brightness.light
                : Brightness.dark,
            primaryColor: AppTheme.appTheme(context).secondary,
            textTheme: GoogleFonts.urbanistTextTheme(),
            scaffoldBackgroundColor: AppTheme.appTheme(context).bg1
            // other config
            ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.initRoute,
      ),
    );
  }
}
