part of screens;

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  remove(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.watch(jobProvider).removeApplication(id: id);
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
    return Scaffold(
      backgroundColor: appTheme.bg1,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: appTheme.txt,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: appTheme.scaffold,
        title: Text(
          "Notifications",
          style: textTheme.labelMedium,
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          // Container(
          //   width: double.infinity,
          //   color: appTheme.scaffold,
          //   child: ListTile(
          //     title: Text(
          //       "Nofitications",
          //       style: textTheme.headlineMedium,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20.0,
          ),
          AdvancedFutureBuilder(
            future: () => ref.watch(jobProvider).loadApplications(),
            builder: (context, snapshot, _) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                itemCount: snapshot.result.length,
                itemBuilder: (context, index) {
                  return BookmarkCard(
                    status: snapshot.result[index]['status'],
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
      ),
    );
  }
}
