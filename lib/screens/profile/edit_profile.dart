part of skillsage_screens;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageFile;

  final TextEditingController _fullname = TextEditingController();

  final TextEditingController _location = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    // User user = context.read<UserProvider>().user;
    // TODO
    _fullname.text = "user.name";
    _location.text = "user.profile.location" ?? '';
    // _phone.text = user.profile.contactInfo ?? '';
    // _email.text = user.email;

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
                      // if (_imageFile != null) ...[
                      //   Image.file(_imageFile!),
                      //   ElevatedButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         _imageFile = null;
                      //       });
                      //     },
                      //     child: Text('Remove Image'),
                      //   ),
                      // ] else ...[
                      //   Text('No image selected'),
                      //   ElevatedButton(
                      //     onPressed: () {
                      //       _pickImage(ImageSource.gallery);
                      //     },
                      //     child: Text('Pick Image'),
                      //   ),
                      // ],
                      Center(
                        child: Stack(
                          children: [
                            Positioned(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: _imageFile == null
                                    ? const AssetImage(
                                        "assets/images/blank_profile.jpg",
                                      )
                                    : FileImage(_imageFile!)
                                        as ImageProvider<Object>?,
                                // child:
                                //     Text(_imageFile.readAsString().toString()),
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
                      Text('location', style: textTheme.displaySmall),
                      CustomTextField(
                        controller: _location,
                      ),
                      Text('phone', style: textTheme.displaySmall),
                      CustomTextField(
                        controller: _phone,
                      ),
                      Text('email', style: textTheme.displaySmall),
                      CustomTextField(
                        isEmail: true,
                        controller: _email,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
