part of skillsage_screens;

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    final navigator = Navigator.of(context);
    final provider = context.read<UserProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      String route = AppRoutes.userLogin;
      final tokenData = await TokenBox.getTokenData();
      if (tokenData.token != null && tokenData.token!.isNotEmpty) {
        provider.user = User.fromJson(jsonDecode(tokenData.user.toString()));
        route = AppRoutes.userProfile;
      }
      navigator.pushReplacementNamed(route);
    });
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
