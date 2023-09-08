part of widgets;

class JobCard extends StatelessWidget {
  final String? title, company, location, datePosted;
  final Icon? icon;
  final double? width;
  final Color? color;
  final List? skills;
  final String? img;
  final void Function()? onPressed;
  const JobCard({
    super.key,
    this.title,
    this.company,
    this.location,
    this.datePosted,
    this.icon,
    this.width,
    this.color,
    this.onPressed,
    this.skills,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    return Container(
      width: width ?? double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                // color: appTheme.primary.withOpacity(.2),
                borderRadius: BorderRadius.circular(10.0),
                image: (img == null)
                    ? const DecorationImage(
                        image: AssetImage('assets/images/default.jpg'),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: NetworkImage(img.toString()),
                        fit: BoxFit.cover,
                      ),
              ),
              // child: Center(
              //   child: Text(
              //     title.toString()[0],
              //     style: textTheme.labelMedium,
              //   ),
              // ),
            ),
            trailing: const Icon(
              CupertinoIcons.bookmark,
              size: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title.toString(),
            style: textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                company.toString(),
                style: textTheme.bodySmall,
              ),
              Text(" . ", style: textTheme.headlineMedium),
              Text(
                location.toString(),
                style: textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          (skills != null)
              ? Wrap(
                  spacing: 10,
                  children: skills!
                      .map(
                        (e) => Chip(
                          label: Text(
                            e.toString(),
                            style: textTheme.bodySmall,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                      .toList(),
                )
              : Container(),
          const SizedBox(
            height: 5,
          ),
          Text(datePosted.toString(), style: textTheme.bodySmall),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
