part of widgets;

class InfoCard extends StatefulWidget {
  final Widget icon;
  final String title;
  final Color? iconColor;
  final String? btnText;
  final Function()? onBtnPressed;
  const InfoCard({
    super.key,
    required this.icon,
    this.iconColor,
    required this.title,
    this.btnText,
    this.onBtnPressed,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();

  factory InfoCard.notFond({
    String? title,
    String? btnText,
    Function()? onBtnPressed,
  }) =>
      InfoCard(
        icon: const Icon(Icons.search_off_rounded),
        title: title ?? "Sorry No Items Found",
        btnText: btnText,
        onBtnPressed: onBtnPressed,
      );

  factory InfoCard.error({
    String? title,
    String? btnText,
    Function()? onBtnPressed,
  }) =>
      InfoCard(
        icon: const Icon(Icons.error),
        title: title ?? "An Error Occurred",
        btnText: btnText,
        onBtnPressed: onBtnPressed,
      );
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
              data: IconThemeData(
                size: 50,
                color: Colors.grey.shade400,
              ),
              child: widget.icon,
            ),
            const SizedBox(height: 10),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              child: Text(widget.title),
            ),
            if (widget.btnText != null) ...[
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: widget.onBtnPressed,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppTheme.appTheme(context).primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.btnText!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
