part of screens;

class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({super.key});
  @override
  ConsumerState<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends ConsumerState<BookmarkScreen> {
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
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    final prov = ref.watch(jobProvider);
    return SafeArea(
      child: Column(children: [
        const SizedBox(
          height: 20.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: CupertinoSearchTextField(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: appTheme.scaffold,
            ),
            style: textTheme.titleSmall,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: AdvancedFutureBuilder(
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
                      onRemove: () async {
                        final resp = await prov.removeBookmark(
                            id: snapshot.result[index]['id']);
                        if (resp) {
                          showToast(context, 'removed');
                        }
                      },
                      // remove(ref, snapshot.result[index]['id'], context),
                      onApply: () async {
                        var resp = await prov.addApplication(
                            id: snapshot.result[index]['id']);
                        if (resp) {
                          showToast(context, 'applied');
                        }
                      }
                      // add(ref, snapshot.result[index]['id'], context),
                      );
                },
              );
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
            emptyBuilder: (context, reload) => SizedBox(
              child: Image.asset("assets/images/not_found.png"),
            ),
          ),
        ),
      ]),
    );
  }
}
