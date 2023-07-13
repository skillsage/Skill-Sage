import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_sage_app/providers/_index.dart';
import 'package:skill_sage_app/utils/_index.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      const ProviderScope(child: SkillSage()),
    );

class SkillSage extends ConsumerWidget {
  const SkillSage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
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
          brightness: ref.read(themeProvider).themeMode == ThemeModeOption.light
              ? Brightness.light
              : Brightness.dark,
          primaryColor: AppTheme.appTheme(context).secondary,
          textTheme: GoogleFonts.urbanistTextTheme(),
          scaffoldBackgroundColor: AppTheme.appTheme(context).bg1
          // other config
          ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.wrapperRoute,
    );
  }
}
