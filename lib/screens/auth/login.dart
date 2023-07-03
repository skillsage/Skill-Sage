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

  @override
  Widget build(BuildContext context) {
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
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.userProfile),
                      child: CustomButton(
                        color: AppTheme.appTheme(context).secondary,
                        title: 'LOGIN',
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
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.userRegister),
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
