part of skillsage_utils;

class AppRoutes {
  static const String initRoute = '/';
  static const String home = '/home';
  static const String userLogin = '/login';
  static const String userRegister = '/signup';
  static const String onboardingProfile = '/onboarding';
  static const String userProfile = '/profile';
  static const String settingsRoute = '/settings';
  static const String editAbout = '/about';
  static const String experienceRoute = '/experience';
  static const String editSkills = '/editskills';
  static const String editLang = '/editlang';
  static const String editProfile = '/editprofile';
}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initRoute:
        return _route(screen: const Loader());
      case AppRoutes.home:
        return _route(screen: const HomeScreen());
      case AppRoutes.userLogin:
        return _route(screen: const LoginScreen());
      case AppRoutes.userRegister:
        return _route(screen: RegisterScreen());
      case AppRoutes.onboardingProfile:
        return _route(screen: OnboardingProfileScreen());
      case AppRoutes.settingsRoute:
        return _route(screen: const SettingsScreen());
      case AppRoutes.editAbout:
        return _route(screen: EditAboutScreen());
      case AppRoutes.experienceRoute:
        return _route(screen: const ExperienceScreen());
      case AppRoutes.editSkills:
        return _route(screen: EditSkillScreen());
      case AppRoutes.userProfile:
        return _route(screen: const ProfileScreen());
      case AppRoutes.editLang:
        return _route(screen: EditLanguageScreen());
      case AppRoutes.editProfile:
        return _route(screen: EditProfileScreen());
      default:
        return _route(screen: const Loader());
    }
  }

  static Route<dynamic>? _route({screen}) {
    return CupertinoPageRoute(builder: (_) => screen);
  }
}
