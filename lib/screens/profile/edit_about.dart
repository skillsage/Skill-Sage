part of skillsage_screens;

class EditAboutScreen extends StatelessWidget {
  EditAboutScreen({super.key});

  final TextEditingController _about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    User user = context.read<UserProvider>().user;
    _about.text = user.profile.about ?? '';

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
              child: CustomButton(
                title: 'SAVE',
                color: AppTheme.appTheme(context).secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
