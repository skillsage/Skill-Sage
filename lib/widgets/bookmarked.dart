part of widgets;

enum JobStatus {
  bookmarked,
  applied,
  pending,
  accepted,
  rejected,
}

class BookmarkCard extends StatefulWidget {
  final String? status;
  final String? title;
  final String? subtitle;
  final String? img;
  final void Function()? onRemove;
  final void Function()? onApply;

  const BookmarkCard({
    Key? key,
    required this.status,
    this.title,
    this.subtitle,
    this.onRemove,
    this.onApply,
    this.img,
  }) : super(key: key);

  @override
  State<BookmarkCard> createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard> {
  late JobStatus status;
  JobStatus getJobStatusFromString(String statusString) {
    switch (statusString.toLowerCase()) {
      case 'bookmarked':
        return JobStatus.bookmarked;
      case 'applied':
        return JobStatus.applied;
      case 'pending':
        return JobStatus.pending;
      case 'accepted':
        return JobStatus.accepted;
      case 'rejected':
        return JobStatus.rejected;
      default:
        throw Exception("Invalid job status string: $statusString");
    }
  }

  @override
  void initState() {
    super.initState();
    status = getJobStatusFromString(widget.status.toString());
  }

  Color _borderColor() {
    switch (status) {
      case JobStatus.bookmarked:
        return Colors.green;
      case JobStatus.applied:
        return Colors.blue;
      case JobStatus.pending:
        return Colors.yellow;
      case JobStatus.accepted:
        return Colors.green;
      case JobStatus.rejected:
        return Colors.red;
    }
  }

  String _statusLabel() {
    switch (status) {
      case JobStatus.applied:
        return "Applied";
      case JobStatus.pending:
        return "Pending";
      case JobStatus.accepted:
        return "Accepted";
      case JobStatus.rejected:
        return "Rejected";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: _borderColor(),
            width: 4,
          ),
        ),
      ),
      child: ListTile(
        leading: Container(
          margin: const EdgeInsets.only(top: 5),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: (widget.img == null)
                ? const DecorationImage(
                    image: AssetImage('assets/images/default.jpg'),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: NetworkImage(widget.img.toString()),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        title: Text(
          widget.title.toString(),
          style: textTheme.labelMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.subtitle.toString(),
              style: textTheme.bodySmall,
            ),
            const SizedBox(
              height: 8,
            ),
            (status == JobStatus.bookmarked)
                ? Container()
                : Text(
                    _statusLabel(),
                    style: TextStyle(
                      color: _borderColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              onPressed: widget.onRemove,
              icon: const Icon(Icons.bookmark_remove),
              label: const Text("Remove"),
            ),
            if (status != JobStatus.rejected && status != JobStatus.pending)
              TextButton.icon(
                onPressed: widget.onApply,
                icon: const Icon(Icons.check),
                label: const Text("Apply"),
              ),
          ],
        ),
      ),
    );
  }
}
