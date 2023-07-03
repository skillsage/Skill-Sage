part of skillsage_widgets;

class ProfileCard extends StatelessWidget {
  final Icon? leadingIcon;
  final IconButton? trailingIcon;
  final String? about, title;
  final Widget widget;
  const ProfileCard({
    super.key,
    this.leadingIcon,
    this.trailingIcon,
    this.about = '',
    this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppTheme.appTheme(context).primary1,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            leading: leadingIcon,
            title: Text(
              title.toString(),
              style: textTheme.labelMedium,
            ),
            trailing: trailingIcon,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          widget,
        ],
      ),
    );
  }
}

class EmptyProfileCard extends StatelessWidget {
  final Icon? leadingIcon;
  final IconButton? trailingIcon;
  final String? title;
  const EmptyProfileCard(
      {super.key, this.leadingIcon, this.trailingIcon, this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppTheme.appTheme(context).primary1,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        leading: leadingIcon,
        title: Text(
          title.toString(),
          style: textTheme.labelMedium,
        ),
        trailing: trailingIcon,
      ),
    );
  }
}
