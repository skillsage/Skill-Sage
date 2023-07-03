part of skillsage_screens;

class OnboardingProfileScreen extends StatelessWidget {
  OnboardingProfileScreen({super.key});

  final List<String> skills = ['Reactjs', 'Angularjs', 'Nodejs', 'MongoDB'];
  final List<String> lang = ['English', 'French'];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(
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
                trailing: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.settingsRoute),
                  icon: const Icon(Icons.settings),
                ),
                title: Text(
                  "Profile",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  // about
                  ProfileCard(
                    title: 'About me',
                    leadingIcon: Icon(
                      CupertinoIcons.profile_circled,
                      color: appTheme.primary2,
                    ),
                    trailingIcon: IconButton(
                      icon: Icon(
                        Icons.edit_sharp,
                        size: 20,
                        color: appTheme.primary2,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.editAbout),
                    ),
                    widget: Text(
                      'A passionate and results-driven backend developer with 5 years of experience. I specialize in designing and implementing scalable and efficient server-side solutions that power modern web applications.',
                      style: textTheme.labelSmall,
                    ),
                  ),

                  // Work Experience
                  ProfileCard(
                    title: 'Work Experience',
                    leadingIcon: Icon(
                      CupertinoIcons.briefcase,
                      color: appTheme.primary2,
                    ),
                    trailingIcon: IconButton(
                      icon: Icon(
                        CupertinoIcons.add_circled_solid,
                        color: appTheme.primary2,
                      ),
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.experienceRoute,
                      ),
                    ),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0,
                          title: Text(
                            'Senior Developer Role',
                            style: textTheme.labelMedium,
                          ),
                          trailing: Icon(
                            Icons.edit_sharp,
                            size: 20,
                            color: appTheme.primary2,
                          ),
                        ),
                        Text(
                          'FinTech Inc.',
                          style: textTheme.labelSmall,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Jan 2015 - Feb 2022 . 5 Years',
                          style: textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  // Skills
                  ProfileCard(
                    title: 'Skills',
                    leadingIcon: Icon(
                      CupertinoIcons.square_stack_3d_up,
                      color: appTheme.primary2,
                    ),
                    trailingIcon: IconButton(
                      icon: Icon(
                        Icons.edit_sharp,
                        size: 20,
                        color: appTheme.primary2,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.editSkills),
                    ),
                    widget: Wrap(
                      spacing: 10,
                      children:
                          skills.map((e) => Chip(label: Text(e))).toList(),
                    ),
                  ),
                  // Language
                  ProfileCard(
                    title: 'Languages',
                    leadingIcon: Icon(
                      CupertinoIcons.globe,
                      color: appTheme.primary2,
                    ),
                    trailingIcon: IconButton(
                      icon: Icon(
                        Icons.edit_sharp,
                        size: 20,
                        color: appTheme.primary2,
                      ),
                      onPressed: () => {},
                    ),
                    widget: Wrap(
                      spacing: 10,
                      children: lang.map((e) => Chip(label: Text(e))).toList(),
                    ),
                  ),
                  // awards
                  ProfileCard(
                    title: 'Awards',
                    leadingIcon: Icon(
                      CupertinoIcons.gift,
                      color: appTheme.primary2,
                    ),
                    trailingIcon: IconButton(
                      icon: Icon(
                        CupertinoIcons.add_circled_solid,
                        color: appTheme.primary2,
                      ),
                      onPressed: () => {},
                    ),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0,
                          title: Text(
                            'MCSD: App Builder',
                            style: textTheme.labelMedium,
                          ),
                          trailing: Icon(
                            Icons.edit_sharp,
                            size: 20,
                            color: appTheme.primary2,
                          ),
                        ),
                        Text(
                          'Young Scientist',
                          style: textTheme.labelSmall,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '2014',
                          style: textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  // cv
                  ProfileCard(
                    title: 'Resume',
                    leadingIcon: Icon(
                      CupertinoIcons.doc_person,
                      color: appTheme.primary2,
                    ),
                    trailingIcon: IconButton(
                      icon: Icon(
                        CupertinoIcons.add_circled_solid,
                        color: appTheme.primary2,
                      ),
                      onPressed: () => {},
                    ),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SvgPicture.asset("assets/svgs/PDF.svg"),
                          title: Text(
                            'Abel Dzanado - CV - Senior Dev',
                            style: textTheme.labelMedium,
                          ),
                          subtitle: Text(
                            '867 Kb . 14 Feb 2022 at 11:30 am',
                            style: textTheme.labelSmall,
                          ),
                          trailing: Icon(
                            CupertinoIcons.delete_simple,
                            color: appTheme.danger,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
