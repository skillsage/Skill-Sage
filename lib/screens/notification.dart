part of screens;

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  remove(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.read(jobProvider).removeApplication(id: id);
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
        child: Expanded(
          child: AdvancedFutureBuilder(
            future: () => ref.read(jobProvider).loadApplications(),
            builder: (context, _, __) {
              return Consumer(builder: (context, ref, child) {
                var jobs = ref.watch(jobProvider);
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  shrinkWrap: true,
                  itemCount: jobs.applications.length,
                  itemBuilder: (context, index) {
                    return BookmarkCard(
                      status: jobs.applications[index]['status'],
                      title: jobs.applications[index]['title'],
                      subtitle: jobs.applications[index]['company'],
                      img: jobs.applications[index]['image'],
                      onRemove: () =>
                          remove(ref, jobs.applications[index]['id'], context),
                      onApply: () =>
                          add(ref, jobs.applications[index]['id'], context),
                    );
                  },
                );
              });
            },
            errorBuilder: (context, error, reload) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(error.toString()),
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
      ),
    );
  }
}
