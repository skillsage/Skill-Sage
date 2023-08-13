part of utils;

class AppTheme {
  late final Color bg1;
  late final Color primary;
  late final Color primary1;
  late final Color primary2;
  late final Color secondary;
  late final Color accent;
  late final Color accentDark;
  late final Color txt;
  late final Color accentTxt;
  late final Color negativeTxt;
  late final Color danger;
  late final Color scaffold;
  late final Color light;
  late final Color primary2Light;
  AppTheme({
    required this.bg1,
    required this.primary,
    required this.primary1,
    required this.primary2,
    required this.secondary,
    required this.accent,
    required this.accentDark,
    required this.txt,
    required this.accentTxt,
    required this.negativeTxt,
    required this.danger,
    required this.scaffold,
    required this.light,
    required this.primary2Light,
  });

  factory AppTheme.dark() {
    return AppTheme(
      bg1: const Color(0xff141625),
      primary: const Color(0xff8C8C8C),
      primary1: const Color(0xff1E2139),
      primary2: const Color(0xffFF9228),
      primary2Light: const Color(0xffFBA34D),
      secondary: const Color(0xff130160),
      accent: const Color(0xffD6CDFE),
      accentDark: const Color(0xff0E7CC9),
      txt: const Color(0xFFffffff),
      accentTxt: const Color(0xff8C8C8C),
      negativeTxt: const Color(0xffFFFFFF),
      danger: const Color(0xffFC4646),
      scaffold: const Color(0xff1E2139),
      light: const Color(0xffffffff),
    );
  }

  factory AppTheme.light() {
    return AppTheme(
      bg1: const Color(0xffF9F9F9),
      primary: const Color(0xff8C8C8C),
      primary1: const Color(0xffffffff),
      primary2: const Color(0xffFF9228),
      primary2Light: const Color(0xffFBA34D),
      secondary: const Color(0xff130160),
      accent: const Color(0xffD6CDFE),
      accentDark: const Color(0xff0E7CC9),
      txt: const Color(0xFF524B6B),
      accentTxt: const Color(0xff8C8C8C),
      negativeTxt: const Color(0xffFFFFFF),
      danger: const Color(0xffFC4646),
      scaffold: const Color(0xffF8F8FB),
      light: const Color(0xffffffff),
    );
  }

  static AppTheme appTheme(BuildContext context) {
    final brightness = CupertinoTheme.of(context).brightness;
    return brightness == Brightness.dark ? AppTheme.dark() : AppTheme.light();
  }
}
