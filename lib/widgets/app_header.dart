part of widgets;

class CustomAppHeader extends ConsumerWidget {
  const CustomAppHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              leading: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  "Discover Your Favorite Tech Skills.",
                  style: textTheme.headlineLarge,
                  maxLines: 2,
                ),
              ),
              // Icon(
              //   CupertinoIcons.bars,
              //   color: appTheme.light,
              // ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.notificationRoute);
                },
                icon: Stack(
                  children: [
                    Icon(
                      CupertinoIcons.bell,
                      color: appTheme.light,
                    ),
                    if (true)
                      Positioned(
                        right: 3,
                        top: 2,
                        child: Container(
                          width: 8, // Adjust the size of the red dot as needed
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.danger,
                          ),
                        ),
                      ),
                  ],
                ),
              )
              // (user == null || user.profileImage == null)
              //     ? const CircleAvatar(
              //         backgroundImage:
              //             AssetImage('assets/images/blank_profile.jpg'),
              //       )
              //     : CircleAvatar(
              //         backgroundImage: NetworkImage(
              //           user.profileImage.toString(),
              //         ),
              //       ),
              ),
          // const SizedBox(
          //   height: 5,
          // ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width / 2,
          //   child: Text(
          //     "Discover Your Favorite Tech Skills.",
          //     style: textTheme.headlineLarge,
          //     maxLines: 2,
          //   ),
          // ),
          const SizedBox(
            height: 29,
          ),
          Row(
            children: [
              Flexible(
                child: CupertinoSearchTextField(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  style: textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.filterRoute),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: appTheme.primary2Light,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    "assets/svgs/Filter.svg",
                    color: appTheme.light,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
