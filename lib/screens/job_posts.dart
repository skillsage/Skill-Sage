part of skillsage_screens;

class JobPostScreen extends ConsumerWidget {
  const JobPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    return Column(children: [
      Container(
        width: double.infinity,
        color: appTheme.scaffold,
        child: ListTile(
          title: Text(
            "Jobs",
            style: textTheme.headlineMedium,
          ),
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ]);
  }
}
