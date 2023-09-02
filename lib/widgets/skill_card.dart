part of widgets;

class SkillCard extends StatelessWidget {
  final String? title, subtitle, description;
  final Icon? icon;
  final double? width;
  final Color? color;
  final void Function()? onPressed;
  const SkillCard({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.width,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    return Container(
      width: width ?? double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: color ?? appTheme.primary1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            leading: Container(
              margin: const EdgeInsets.only(top: 5),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: appTheme.primary.withOpacity(.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  title.toString()[0],
                  style: textTheme.labelMedium,
                ),
              ),
            ),
            title: Text(
              title.toString(),
              style: textTheme.headlineMedium,
            ),
            // subtitle: Text(
            //   subtitle.toString(),
            //   style: textTheme.bodySmall,
            // ),
            trailing: const Icon(
              CupertinoIcons.bookmark,
              size: 20,
            ),
          ),
          // Text(
          //   description.toString(),
          //   style: textTheme.bodySmall,
          // ),
          // const SizedBox(
          //   height: 18,
          // ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: onPressed,
              child: const Text("Learn Skill"),
            ),
          )
        ],
      ),
    );
  }
}
