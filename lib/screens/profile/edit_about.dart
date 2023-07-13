part of skillsage_screens;

class EditAboutScreen extends ConsumerStatefulWidget {
  const EditAboutScreen({super.key});

  @override
  ConsumerState<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends ConsumerState<EditAboutScreen> {
  final TextEditingController _about = TextEditingController();

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
    final appTheme = AppTheme.appTheme(context);
    final navigator = Navigator.of(context);

    User? user = ref.watch(userProvider.notifier).user;

    _about.text = user!.profile.about ?? '';

    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: appTheme.scaffold,
              child: ListTile(
                leading: IconButton(
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    size: 20,
                  ),
                  onPressed: Navigator.of(context).pop,
                ),
                title: Text(
                  "About me",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: _about,
                        maxLine: 15,
                        hintText: 'Tell us about yourself',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: GestureDetector(
                onTap: () async {
                  // final response = await provider.updateProfile({
                  //   "about": _about.text,
                  // });
                  // if (response["success"]) {
                  //   showCupertinoToast("about updated sucessfully");
                  //   navigator.pushReplacementNamed(AppRoutes.userProfile);
                  // } else {
                  //   showCupertinoToast(response["result"]);
                  // }
                },
                child: CustomButton(
                  title: 'SAVE',
                  color: AppTheme.appTheme(context).secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
