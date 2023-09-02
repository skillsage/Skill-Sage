part of screens;

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

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
                    "Available Courses",
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
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.courseDetails),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: appTheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(url), fit: BoxFit.cover)),
                      ),
                      title: Text(
                        'Python For Beginners',
                        style: textTheme.headlineMedium,
                      ),
                      subtitle: Text(
                        'No prior knowledge required',
                        style: textTheme.bodySmall,
                      )),
                ),
              ),
              itemCount: 1,
            )
          ]);
        },
        errorBuilder: (context, error, reload) => Text(error.toString()),
      )),
    );
  }
}
