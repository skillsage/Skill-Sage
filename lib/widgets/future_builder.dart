part of widgets;

typedef BuilderFunction<T> = Widget Function(
    BuildContext context, T result, Future<void> Function() reload);
typedef ErrorBuilderFunction<T> = Widget Function(
  BuildContext context,
  Object error,
  Future<void> Function() reload,
);
typedef EmptyBuilderFunction<T> = Widget Function(
    BuildContext context, Future<void> Function() reload);

class AdvancedFutureBuilder<T> extends StatefulWidget {
  final Future<T> Function() future;

  final BuilderFunction<T> builder;
  final EmptyBuilderFunction<T>? emptyBuilder;
  final ErrorBuilderFunction<T>? errorBuilder;

  const AdvancedFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
    this.emptyBuilder,
    this.errorBuilder,
  });

  @override
  State<AdvancedFutureBuilder<T>> createState() =>
      _AdvancedFutureBuilderState();
}

class _AdvancedFutureBuilderState<T> extends State<AdvancedFutureBuilder<T>> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
    super.initState();
  }

  bool loading = true;
  Object? error;
  T? result;

  Future<void> init() async {
    try {
      if (!loading) {
        setState(() {
          loading = true;
          error = null;
        });
      }
      result = await widget.future();
      setState(() {
        loading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          loading = false;
          error = e;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (loading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (error != null) {
          if (widget.errorBuilder != null) {
            return widget.errorBuilder!(context, error!, init);
          }
          return InfoCard.error(
            btnText: "Reload",
            onBtnPressed: () {
              init();
            },
          );
        }
        if (result != null) {
          return widget.builder(context, result as T, init);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
