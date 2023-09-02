part of screens;

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    return SafeArea(
      child: Column(children: [
        Container(
          width: double.infinity,
          color: appTheme.scaffold,
          child: ListTile(
            title: Center(
              child: Text(
                "Bookmarked",
                style: textTheme.headlineMedium,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Bookmarked(),
        const Divider(),
        const Bookmarked(),
      ]),
    );
  }
}
