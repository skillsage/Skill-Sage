part of screens;

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  File? _imageFile;

  final TextEditingController _fullname = TextEditingController();

  final TextEditingController _location = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _portfolio = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  updateProfile() async {
    try {
      final prov = ref.read(userProvider.notifier);
      final res = await prov.updateProfile(
        location: _location.text,
        portfolio: _portfolio.text,
        image: _imageFile,
      );
      print('res: $res');
      if (!res.success) {
        showToast(context, "unable to update");
      }
      if (res.success) {
        goBack();
      }
      // handle success
    } catch (e) {
      print(e);
      showToast(context, "Unexpected err");
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

    if (user != null) {
      _fullname.text = user.name;
      _location.text = user.profile.location ?? '';
      _portfolio.text = user.profile.portfolio ?? '';
      _email.text = user.email;
    }

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
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    size: 20,
                  ),
                  onPressed: Navigator.of(context).pop,
                ),
                title: Text(
                  "Profile",
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
                      Center(
                        child: Stack(
                          children: [
                            Positioned(
                              child: (user == null ||
                                      user.profileImage == null ||
                                      _imageFile != null)
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage: _imageFile == null
                                          ? const AssetImage(
                                              "assets/images/blank_profile.jpg",
                                            )
                                          : FileImage(_imageFile!)
                                              as ImageProvider<Object>?,
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                        user.profileImage.toString(),
                                      ),
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: appTheme.secondary,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.edit_sharp,
                                    size: 18,
                                    color: appTheme.light,
                                  ),
                                  onPressed: () =>
                                      _pickImage(ImageSource.gallery),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Fullname',
                        style: textTheme.displaySmall,
                      ),
                      CustomTextField(
                        controller: _fullname,
                      ),
                      Text('email', style: textTheme.displaySmall),
                      CustomTextField(
                        isEmail: true,
                        controller: _email,
                      ),
                      Text('location', style: textTheme.displaySmall),
                      CustomTextField(
                        controller: _location,
                      ),
                      Text('portfolio', style: textTheme.displaySmall),
                      CustomTextField(
                        controller: _portfolio,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
