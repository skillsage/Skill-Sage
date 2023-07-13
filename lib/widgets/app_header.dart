part of skillsage_widgets;

class CustomAppHeader extends StatelessWidget {
  const CustomAppHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: appTheme.secondary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              CupertinoIcons.bars,
              color: appTheme.light,
            ),
            trailing: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              "Discover Your Favorite Tech Skills.",
              style: textTheme.headlineLarge,
              maxLines: 2,
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Row(
            children: [
              Flexible(
                child: CupertinoSearchTextField(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appTheme.light,
                  ),

                  style: textTheme.titleSmall,

                  // backgroundColor: appTheme.light,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    color: appTheme.primary2Light,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    CupertinoIcons.list_bullet,
                    color: appTheme.light,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}