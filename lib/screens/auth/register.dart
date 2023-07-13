part of skillsage_screens;

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _key = GlobalKey<FormState>();

  bool loading = false;

  // Snackbar

  register() async {
    if (!_key.currentState!.validate()) {
      return;
    }

    setState(() {
      loading = true;
    });
    try {
      final user = ref.watch(userProvider.notifier);
      final res = await user.register(
          fullname: _fullname.text,
          email: _email.text,
          password: _password.text);
      if (res.success) {
        gotoHome();
        return;
      }
      showToast(context, res.error ?? "Error");
      setState(() {
        loading = false;
      });
    } catch (e) {
      showToast(context, "Some Error Happens");
      setState(() {
        loading = true;
      });
    }
  }

  gotoHome() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      backgroundColor: AppTheme.appTheme(context).bg1,
      body: SafeArea(
        child: Form(
          key: _key,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Create an account",
                      style: textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Help you create an account on Skill Sage",
                      style: textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Text(
                    'Full name',
                    style: textTheme.displaySmall,
                  ),
                  CustomTextField(
                    hintText: 'Fullname',
                    controller: _fullname,
                  ),
                  Text('Email', style: textTheme.displaySmall),
                  CustomTextField(
                    hintText: 'Email',
                    controller: _email,
                    isEmail: true,
                  ),
                  Text('Password', style: textTheme.displaySmall),
                  CustomTextField(
                    hintText: 'Password',
                    controller: _password,
                    isPassword: true,
                  ),
                  CustomButton(
                    color: AppTheme.appTheme(context).secondary,
                    onPressed: register,
                    title: 'SIGN UP',
                    isLoading: loading,
                    // icon: Icon(Icons.facebook),
                  ),
                  CustomButton(
                    color: AppTheme.appTheme(context).accent,
                    title: 'SIGN UP WITH GOOGLE',
                    icon: SvgPicture.asset("assets/svgs/google.svg"),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: textTheme.bodySmall,
                      ),
                      InkWell(
                        onTap: () {
                          if (!loading) {
                            Navigator.pushNamed(context, AppRoutes.userLogin);
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
