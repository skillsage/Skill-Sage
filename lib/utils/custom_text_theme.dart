part of skillsage_utils;

class CustomTextTheme {
  late TextTheme textTheme;

  static CustomTextTheme customTextTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? dark(context)
        : light(context);
  }

  static CustomTextTheme light(BuildContext context) => CustomTextTheme()
    ..textTheme = TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        letterSpacing: .23,
        color: AppTheme.appTheme(context).txt,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: .138,
        color: AppTheme.appTheme(context).txt,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        letterSpacing: .84,
        color: AppTheme.appTheme(context).primary1,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        letterSpacing: .84,
        color: AppTheme.appTheme(context).txt,
        // color: AppTheme.appTheme(context).primary1,
      ),
      headlineMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        letterSpacing: .84,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: .138,
        color: AppTheme.appTheme(context).primary1,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: .138,
        color: AppTheme.appTheme(context).txt,
      ),
    );
  static CustomTextTheme dark(BuildContext context) => CustomTextTheme()
    ..textTheme = TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        letterSpacing: .23,
        color: AppTheme.appTheme(context).txt,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).txt,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: .138,
        color: AppTheme.appTheme(context).txt,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        letterSpacing: .84,
        color: AppTheme.appTheme(context).txt,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        letterSpacing: .84,
        color: AppTheme.appTheme(context).txt,
        // color: AppTheme.appTheme(context).primary1,
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        letterSpacing: .84,
        color: AppTheme.appTheme(context).txt,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: .138,
        color: AppTheme.appTheme(context).txt,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: .138,
        color: AppTheme.appTheme(context).txt,
      ),
    );
}
