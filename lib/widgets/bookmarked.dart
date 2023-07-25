part of skillsage_widgets;

class Bookmarked extends ConsumerWidget {
  const Bookmarked({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.green,
        width: 2,
      ))),
      child: ListTile(
        leading: const Icon(Icons.javascript),
        title: Text(
          "React",
          style: textTheme.labelMedium,
        ),
        subtitle: Text(
          "A java script framework",
          style: textTheme.bodySmall,
        ),
        trailing: const Icon(Icons.remove),
      ),
    );
  }
}
