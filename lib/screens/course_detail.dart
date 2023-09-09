part of screens;

class CourseDetailScreen extends ConsumerWidget {
  final Map? course;
  const CourseDetailScreen({super.key, this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final data = course!['data'];
    List requirements = data['requirements'];
    List lessons = data['lessons'];
    List skills = data['skills'];
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: AdvancedFutureBuilder(
          future: () => ref.watch(courseProvider).loadCourses(),
          builder: (context, snapshot, _) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  color: appTheme.scaffold,
                  child: ListTile(
                    leading: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                        size: 20,
                      ),
                      onPressed: Navigator.of(context).pop,
                    ),
                    title: Center(
                      child: Text(
                        "Details",
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.bookmark,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.network(data['image'], fit: BoxFit.cover),
                ),
                DefaultTabController(
                  length: 4,
                  child: Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TabBar(
                          labelColor: appTheme.txt,
                          tabs: const [
                            Tab(
                              text: "Overview",
                            ),
                            Tab(
                              text: "Requirements",
                            ),
                            Tab(
                              text: "Lessons",
                            ),
                            Tab(
                              text: "Skills",
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Title",
                                        style: textTheme.bodyMedium,
                                      ),
                                      Text(
                                        data['title'],
                                        style: textTheme.bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "SubTitle",
                                        style: textTheme.bodyMedium,
                                      ),
                                      Text(
                                        data['sub_title'],
                                        style: textTheme.bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Language",
                                        style: textTheme.bodyMedium,
                                      ),
                                      Text(
                                        data['language'],
                                        style: textTheme.bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Description",
                                        style: textTheme.bodyMedium,
                                      ),
                                      Text(
                                        data['description'],
                                        style: textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: requirements
                                        .map(
                                          (e) => Text(
                                            e,
                                            style: textTheme.labelMedium,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ]),
                                Column(children: [
                                  Column(
                                    children: lessons
                                        .map(
                                          (e) => Text(
                                            e,
                                            style: textTheme.labelMedium,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ]),
                                Column(children: [
                                  Column(
                                    children: skills
                                        .map(
                                          (e) => Text(
                                            e,
                                            style: textTheme.labelMedium,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                        CustomButton(
                          onPressed: () => Navigator.pushNamed(
                              context, AppRoutes.contentRoute,
                              arguments: {"items": data['items']}),
                          title: "Course Content",
                          color: appTheme.secondary,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          errorBuilder: (context, error, reload) => Column(
            children: [
              const Text('An Error Occured!'),
              const SizedBox(height: 10),
              Text(error.toString()),
              TextButton(
                onPressed: reload,
                child: const Text("reload"),
              )
            ],
          ),
          emptyBuilder: (context, reload) => Center(
            child: Center(
              child: Image.asset("assets/images/not_found.png"),
            ),
          ),
        ),
      ),
    );
  }
}
