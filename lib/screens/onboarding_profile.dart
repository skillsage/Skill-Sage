part of screens;

class OnboardingProfileScreen extends StatelessWidget {
  const OnboardingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appTheme.secondary,
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        },
        child: Icon(CupertinoIcons.arrow_right, color: appTheme.txt),
      ),
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: appTheme.scaffold,
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Text(
                "Create a Skill Sage Profile",
                style: textTheme.headlineMedium,
              ),
            ),
            const Expanded(
              child: Profiles(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
