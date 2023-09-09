part of screens;

class CoursesScreen extends ConsumerWidget {
  final Map? skill;
  const CoursesScreen({super.key, this.skill});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
          child: AdvancedFutureBuilder(
        future: () => ref.watch(courseProvider).searchCourse(skill!['skill']),
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
                onTap: () => Navigator.pushNamed(
                    context, AppRoutes.courseDetails,
                    arguments: {"data": snapshot.result[index]}),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: (snapshot.result[index]['image'] == null)
                              ? const DecorationImage(
                                  image:
                                      AssetImage('assets/images/default.jpg'),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: NetworkImage(
                                      snapshot.result[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      title: Text(
                        snapshot.result[index]['title'],
                        style: textTheme.headlineMedium,
                      ),
                      subtitle: Text(
                        snapshot.result[index]['sub_title'],
                        style: textTheme.bodySmall,
                      )),
                ),
              ),
              itemCount: snapshot.result.length,
            )
          ]);
        },
        errorBuilder: (context, error, reload) => Text(error.toString()),
      )),
    );
  }
}
