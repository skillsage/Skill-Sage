part of skillsage_screens;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _key = GlobalKey<FormState>();

  // Snackbar
  void showCupertinoToast(String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: CustomTextTheme.customTextTheme(context).textTheme.labelSmall,
        ),
        backgroundColor: AppTheme.appTheme(context).primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final user = context.watch<UserProvider>();
    final navigator = Navigator.of(context);
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
                  GestureDetector(
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        user.isLoading = true;
                        Map<String, dynamic> response = await user.register(
                          name: _fullname.text,
                          email: _email.text,
                          password: _password.text,
                        );
                        if (response["success"]) {
                          showCupertinoToast("account created successfully");
                          navigator.pushNamed(AppRoutes.initRoute);
                        } else {
                          showCupertinoToast(response["result"]);
                        }
                      }
                    },
                    child: Consumer<UserProvider>(
                      builder: (context, user, _) => CustomButton(
                        color: AppTheme.appTheme(context).secondary,
                        title: 'SIGN UP',
                        isLoading: user.isLoading,
                        // icon: Icon(Icons.facebook),
                      ),
                    ),
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
                        onTap: () => (!user.isLoading)
                            ? Navigator.pushNamed(context, AppRoutes.userLogin)
                            : null,
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
