part of skillsage_widgets;

class CustomButton extends StatelessWidget {
  final Color? color;
  final String? title;
  final Widget? icon;
  final bool? isLoading;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    this.color,
    this.title,
    this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            isLoading!
                ? CupertinoActivityIndicator(
                    color: AppTheme.appTheme(context).light,
                  )
                : Text(
                    title.toString(),
                    style: CustomTextTheme.customTextTheme(context)
                        .textTheme
                        .labelLarge,
                  ),
          ],
        ),
      ),
    );
  }
}
