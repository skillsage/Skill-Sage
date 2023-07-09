part of skillsage_screens;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _key = GlobalKey<FormState>();

  bool? rememberMe = false;

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
                        "Welcome Back",
                        style: CustomTextTheme.customTextTheme(context)
                            .textTheme
                            .displayMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                        textAlign: TextAlign.center,
                        style: CustomTextTheme.customTextTheme(context)
                            .textTheme
                            .bodySmall,
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Text('Email',
                        style: CustomTextTheme.customTextTheme(context)
                            .textTheme
                            .displaySmall),
                    CustomTextField(
                      hintText: 'Email',
                      controller: _email,
                      isEmail: true,
                    ),
                    Text('Password',
                        style: CustomTextTheme.customTextTheme(context)
                            .textTheme
                            .displaySmall),
                    CustomTextField(
                      hintText: 'Password',
                      controller: _password,
                      isPassword: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) => {
                                setState(() {
                                  rememberMe = value;
                                })
                              },
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: CustomTextTheme.customTextTheme(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => {
                            // TODO: implement forgot password
                          },
                          child: Text(
                            'Forgot Password?',
                            style: CustomTextTheme.customTextTheme(context)
                                .textTheme
                                .displaySmall,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_key.currentState!.validate()) {
                          user.isLoading = true;
                          Map<String, dynamic> response = await user.login(
                            email: _email.text,
                            password: _password.text,
                            rememberMe: rememberMe,
                          );
                          if (response["success"]) {
                            showCupertinoToast("user login successful");
                            navigator
                                .pushReplacementNamed(AppRoutes.userProfile);
                          } else {
                            showCupertinoToast(response["result"]);
                          }
                        }
                      },
                      child: Consumer<UserProvider>(
                        builder: (context, user, _) => CustomButton(
                          color: AppTheme.appTheme(context).secondary,
                          title: 'LOGIN',
                          isLoading: user.isLoading,
                        ),
                      ),
                    ),
                    CustomButton(
                      color: AppTheme.appTheme(context).accent,
                      title: 'SIGN IN WITH GOOGLE',
                      icon: SvgPicture.asset("assets/svgs/google.svg"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You don't have an account? ",
                          style: CustomTextTheme.customTextTheme(context)
                              .textTheme
                              .bodySmall,
                        ),
                        InkWell(
                          onTap: () => (!user.isLoading)
                              ? Navigator.pushNamed(
                                  context, AppRoutes.userRegister)
                              : null,
                          child: Text(
                            'Sign Up',
                            style: CustomTextTheme.customTextTheme(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
