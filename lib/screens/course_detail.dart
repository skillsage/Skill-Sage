part of screens;

class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key});

  final String url =
      "https://images.unsplash.com/photo-1649180556628-9ba704115795?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2062&q=80";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
          child: AdvancedFutureBuilder(
        future: () => ref.watch(courseProvider).loadCourses(),
        builder: (context, snapshot, _) {
          return Column(children: [
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
              child: Image.network(url, fit: BoxFit.cover),
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
                              child: Text(
                                "snapshot.result[0]",
                                style: textTheme.bodyMedium,
                              ),
                            ),
                            Center(
                              child: Text("Requirements",
                                  style: textTheme.labelMedium),
                            ),
                            Center(
                              child:
                                  Text("Lessons", style: textTheme.labelMedium),
                            ),
                            Center(
                              child:
                                  Text("Skills", style: textTheme.labelMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.contentRoute,
                      ),
                      title: "Course Content",
                      color: appTheme.secondary,
                    )
                  ],
                ),
              ),
            ),
          ]);
        },
        errorBuilder: (context, error, reload) => Text(error.toString()),
      )),
    );
  }
}
