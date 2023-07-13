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
    final nav = Navigator.of(context);
    final prov = context.read<HttpProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString(tokenKey);
      print("token == $token");
      if (token != null) {
        await prov.init();
        nav.pushNamed(AppRoutes.home);
      } else {
        nav.pushNamed(AppRoutes.userLogin);
      }
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
