part of screens;

class EditAboutScreen extends ConsumerStatefulWidget {
  const EditAboutScreen({super.key});

  @override
  ConsumerState<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends ConsumerState<EditAboutScreen> {
  final TextEditingController _about = TextEditingController();

  bool loading = false;

  updateProfile() async {
    setState(() {
      loading = true;
    });
    try {
      final prov = ref.read(userProvider.notifier);
      final res = await prov.updateProfile(about: _about.text);
      print('res: $res');
      if (!res.success) {
        showToast(context, "unable to update");
      }
      if (res.success) {
        goBack();
      }
      setState(() {
        loading = false;
      });
      // handle success
    } catch (e) {
      print(e);
      showToast(context, "Unexpected err");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    User? user = ref.watch(userProvider.notifier).user;

    _about.text = (user != null) ? user.profile.about ?? '' : '';

    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: appTheme.scaffold,
              child: ListTile(
                leading: IconButton(
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    size: 20,
                  ),
                  onPressed: Navigator.of(context).pop,
                ),
                title: Text(
                  "About me",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: _about,
                        maxLine: 15,
                        hintText: 'Tell us about yourself',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: CustomButton(
                title: 'SAVE',
                color: AppTheme.appTheme(context).secondary,
                onPressed: updateProfile,
                isLoading: loading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
