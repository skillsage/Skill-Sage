part of screens;

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  remove(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.watch(jobProvider).removeBookmark(id: id);
    if (resp) {
      showToast(context, 'removed');
    }
  }

  add(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.watch(jobProvider).addApplication(id: id);
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
        AdvancedFutureBuilder(
          future: () => ref.watch(jobProvider).loadBookmark(),
          builder: (context, snapshot, _) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemCount: snapshot.result.length,
              itemBuilder: (context, index) {
                print(snapshot.result.length);
                return BookmarkCard(
                  status: 'bookmarked',
                  title: snapshot.result[index]['title'],
                  subtitle: snapshot.result[index]['company'],
                  img: snapshot.result[index]['image'],
                  onRemove: () =>
                      remove(ref, snapshot.result[index]['id'], context),
                  onApply: () =>
                      add(ref, snapshot.result[index]['id'], context),
                );
              },
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
      ]),
    );
  }
}
