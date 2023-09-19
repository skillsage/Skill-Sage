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
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            CupertinoIcons.arrow_left,
            size: 20,
            color: appTheme.txt,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        title: Center(
          child: Text(
            "Details",
            style: textTheme.labelMedium,
          ),
        ),
        elevation: 0,
        backgroundColor: appTheme.scaffold,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bookmark,
              size: 20,
              color: appTheme.txt,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: AdvancedFutureBuilder(
          future: () => ref.watch(courseProvider).loadCourses(data['id']),
          builder: (context, snapshot, _) {
            return Expanded(
              child: Column(
                children: [
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
                                          "About this course",
                                          style: textTheme.bodyLarge,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.15),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['title'],
                                                  style: textTheme.bodyMedium,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  data['sub_title'],
                                                  style: textTheme.bodyMedium,
                                                ),
                                              ]),
                                        ),
                                        const Divider(),
                                        Text(
                                          "Language",
                                          style: textTheme.bodyMedium,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.15),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            data['language'],
                                            style: textTheme.bodyMedium,
                                          ),
                                        ),
                                        const Divider(),
                                        Text(
                                          "Description",
                                          style: textTheme.bodyMedium,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.15),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            data['description'],
                                            style: textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "What you will need",
                                            style: textTheme.bodyLarge,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(.15),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: requirements
                                                  .map(
                                                    (e) => ListTile(
                                                      minLeadingWidth: 0,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      titleAlignment:
                                                          ListTileTitleAlignment
                                                              .center,
                                                      minVerticalPadding: 0,
                                                      leading: Container(
                                                        width: 10,
                                                        height: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: appTheme.txt,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        e,
                                                        style: textTheme
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "What you will learn",
                                            style: textTheme.bodyLarge,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(.15),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: lessons
                                                  .map(
                                                    (e) => ListTile(
                                                      minLeadingWidth: 0,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      titleAlignment:
                                                          ListTileTitleAlignment
                                                              .center,
                                                      minVerticalPadding: 0,
                                                      leading: Container(
                                                        width: 10,
                                                        height: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: appTheme.txt,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        e,
                                                        style: textTheme
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Skills",
                                            style: textTheme.bodyLarge,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(.15),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: skills
                                                  .map(
                                                    (e) => ListTile(
                                                      minLeadingWidth: 0,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      titleAlignment:
                                                          ListTileTitleAlignment
                                                              .center,
                                                      minVerticalPadding: 0,
                                                      leading: Container(
                                                        width: 10,
                                                        height: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: appTheme.txt,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        e,
                                                        style: textTheme
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ]),
                                  ),
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
              ),
            );
          },
          errorBuilder: (context, error, reload) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  error.toString(),
                  style: textTheme.labelSmall,
                ),
                TextButton(
                  onPressed: reload,
                  child: const Text("reload"),
                )
              ],
            ),
          ),
          emptyBuilder: (context, reload) => Center(
            child: SizedBox(
              child: Image.asset("assets/images/not_found.png"),
            ),
          ),
        ),
      ),
    );
  }
}
