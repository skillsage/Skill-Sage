part of screens;

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  remove(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.read(jobProvider).removeBookmark(id: id);
    if (resp) {
      showToast(context, 'removed');
    }
  }

  add(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.read(jobProvider).addApplication(id: id);
    if (resp) {
      showToast(context, 'applied');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    return SafeArea(
      child: Column(children: [
        // Container(
        //   width: double.infinity,
        //   color: appTheme.scaffold,
        //   child: ListTile(
        //     title: Center(
        //       child: Text(
        //         "Bookmarked",
        //         style: textTheme.headlineMedium,
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: CupertinoSearchTextField(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: appTheme.light,
            ),
            style: textTheme.titleSmall,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: AdvancedFutureBuilder(
            future: () => ref.read(jobProvider).loadBookmark(),
            builder: (context, snapshot, _) {
              return Consumer(builder: (context, ref, child) {
                var jobs = ref.watch(jobProvider);
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  shrinkWrap: true,
                  itemCount: jobs.bookmarks.length,
                  itemBuilder: (context, index) {
                    return BookmarkCard(
                      status: 'bookmarked',
                      title: jobs.bookmarks[index]['title'],
                      subtitle: jobs.bookmarks[index]['company'],
                      img: jobs.bookmarks[index]['image'],
                      onRemove: () =>
                          remove(ref, jobs.bookmarks[index]['id'], context),
                      onApply: () =>
                          add(ref, jobs.bookmarks[index]['id'], context),
                    );
                  },
                );
              });
            },
            errorBuilder: (context, error, reload) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
            emptyBuilder: (context, reload) => Center(
              child: Center(
                child: Image.asset("assets/images/not_found.png"),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
