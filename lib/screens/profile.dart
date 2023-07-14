part of skillsage_screens;

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  List<File?> _resume = [];
  Future<void> pickResume() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        File file = File(result.files.single.path.toString());
        // await resume.uploadResume(file: file);
        setState(
          () => _resume.add(file),
        );
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('d MMM y').format(date);
    String formattedTime = DateFormat('h:mm a').format(date);
    return '$formattedDate at $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;

    final prov = ref.watch(userProvider);
    User? user = prov.user;
    _resume = [...user!.resume!.map((e) => File(e))];

    // remove the scaffold
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(
              name: user.name,
              location: user.profile.location ?? '',
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  (user.profile.about == null || user.profile.about!.isEmpty)
                      ? EmptyProfileCard(
                          title: 'About me',
                          leadingIcon: Icon(
                            CupertinoIcons.profile_circled,
                            color: appTheme.primary2,
                          ),
                          trailingIcon: IconButton(
                            icon: Icon(
                              CupertinoIcons.add_circled_solid,
                              color: appTheme.primary2,
                            ),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              AppRoutes.editAbout,
                            ),
                          ),
                        )
                      : ProfileCard(
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
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoutes.editAbout),
                          ),
                          widget: Text(
                            user.profile.about.toString(),
                            style: textTheme.labelSmall,
                          ),
                        ),
                  (user.experience!.isEmpty)
                      ? EmptyProfileCard(
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
                        )
                      : ProfileCard(
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
                            children: user.experience!
                                .map(
                                  (e) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        minVerticalPadding: 0,
                                        title: Text(
                                          e.jobTitle,
                                          style: textTheme.labelMedium,
                                        ),
                                        trailing: Icon(
                                          Icons.edit_sharp,
                                          size: 20,
                                          color: appTheme.primary2,
                                        ),
                                      ),
                                      Text(
                                        e.companyName,
                                        style: textTheme.labelSmall,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${e.startDate} - ${e.endDate ?? 'present'} . ${e.endDate != null ? '${(int.parse(e.endDate!.split('-')[0]) - int.parse(e.startDate.split('-')[0])).toString()} Years' : "works here"}',
                                        style: textTheme.labelSmall,
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                  (user.skills!.isEmpty)
                      ? EmptyProfileCard(
                          title: 'Skills',
                          leadingIcon: Icon(
                            CupertinoIcons.square_stack_3d_up,
                            color: appTheme.primary2,
                          ),
                          trailingIcon: IconButton(
                            icon: Icon(
                              CupertinoIcons.add_circled_solid,
                              color: appTheme.primary2,
                            ),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              AppRoutes.editSkills,
                            ),
                          ),
                        )
                      : ProfileCard(
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
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoutes.editSkills),
                          ),
                          widget: Wrap(
                            spacing: 10,
                            children: user.skills!
                                .map(
                                  (e) => Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    label: Text(e),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                  (user.profile.languages == null ||
                          user.profile.languages!.isEmpty)
                      ? EmptyProfileCard(
                          title: 'Languages',
                          leadingIcon: Icon(
                            CupertinoIcons.globe,
                            color: appTheme.primary2,
                          ),
                          trailingIcon: IconButton(
                            icon: Icon(
                              CupertinoIcons.add_circled_solid,
                              color: appTheme.primary2,
                            ),
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoutes.editLang),
                          ),
                        )
                      : ProfileCard(
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
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoutes.editLang),
                          ),
                          widget: Wrap(
                            spacing: 10,
                            children: user.profile.languages!
                                .map(
                                  (e) => Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    label: Text(e),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                  // awards
                  // EmptyProfileCard(
                  //   title: 'Awards',
                  //   leadingIcon: Icon(
                  //     CupertinoIcons.gift,
                  //     color: appTheme.primary2,
                  //   ),
                  //   trailingIcon: IconButton(
                  //     icon: Icon(
                  //       CupertinoIcons.add_circled_solid,
                  //       color: appTheme.primary2,
                  //     ),
                  //     onPressed: () => {},
                  //   ),
                  // ),
                  // cv
                  (user.resume!.isEmpty)
                      ? EmptyProfileCard(
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
                            onPressed: pickResume,
                          ),
                        )
                      : ProfileCard(
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
                            onPressed: pickResume,
                          ),
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _resume
                                .map(
                                  (e) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading:
                                        SvgPicture.asset("assets/svgs/PDF.svg"),
                                    title: Text(
                                      e!.path.split('/').last.toString(),
                                      style: textTheme.labelMedium,
                                    ),
                                    // subtitle: Text(
                                    //   '${e.lengthSync()} Kb . ${formatDate(
                                    //     e.lastAccessedSync().toString(),
                                    //   )}',
                                    //   style: textTheme.labelSmall,
                                    // ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        CupertinoIcons.delete_simple,
                                        color: appTheme.danger,
                                      ),
                                      onPressed: () =>
                                          setState(() => _resume.remove(e)),
                                    ),
                                  ),
                                )
                                .toList(),
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

class ProfileHeader extends ConsumerWidget {
  final String? name, location;
  const ProfileHeader({super.key, this.name, this.location});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final prov = ref.read(userProvider.notifier);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 5.0, bottom: 15.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.refresh_outlined,
                    color: appTheme.light,
                    size: 20,
                  ),
                  onPressed: () {
                    prov.reloadUser();
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.settings,
                    color: appTheme.light,
                    size: 20,
                  ),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.settingsRoute,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name.toString(),
                  style: textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  location.toString(),
                  style: textTheme.labelSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('120k Follower', style: textTheme.headlineSmall),
                    Text('120k Following', style: textTheme.headlineSmall),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.editProfile),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            color: appTheme.light.withOpacity(.15),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text('Edit Profile',
                                style: textTheme.headlineSmall),
                            const SizedBox(width: 15),
                            Icon(
                              Icons.edit_sharp,
                              size: 20,
                              color: appTheme.light,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
