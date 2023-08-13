part of screens;

class Loader extends ConsumerStatefulWidget {
  const Loader({super.key});

  @override
  ConsumerState<Loader> createState() => _LoaderState();
}

class _LoaderState extends ConsumerState<Loader> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
    super.initState();
  }

  init() async {
    final http = ref.read(httpProvider);
    final user = ref.read(userProvider.notifier);

    if (await http.checkToken()) {
      if (await user.reloadUser() && user.user!.profile.updated != null) {
        goto(AppRoutes.home);
        return;
      } else {
        goto(AppRoutes.onboardingProfile);
        return;
      }
    }

    goto(AppRoutes.userLogin);
  }

  goto(String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
