part of screens;

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProv = ref.watch(themeProvider.notifier);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    final navigator = Navigator.of(context);
    return Scaffold(
      backgroundColor: AppTheme.appTheme(context).bg1,
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
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  "Settings",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'Skill Sage v1.0',
                style: textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              title: Text(
                '${themeProv.themeMode.toString().split('.')[1]} theme',
                style: textTheme.labelMedium,
              ),
              trailing: CupertinoSwitch(
                  value: themeProv.themeMode.index == 1,
                  onChanged: (val) {
                    themeProv.toggleThemeMode();
                  }),
            ),
            // Center(
            //   child: CupertinoButton(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 5.0, horizontal: 9.0),
            //     color: appTheme.danger,
            //     child: Text(
            //       'Delete Account',
            //       style: textTheme.headlineSmall,
            //     ),
            //     onPressed: () {},
            //   ),
            // ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appTheme.danger,
                ),
                onPressed: () async {
                  await ref.read(userProvider.notifier).logout();
                  navigator.pushNamed(AppRoutes.userLogin);
                },
                child: Text(
                  'Logout',
                  style: textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
