part of screens;

class EditLanguageScreen extends ConsumerWidget {
  EditLanguageScreen({super.key});

  final TextEditingController _lang = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    User? user = ref.watch(userProvider).user;

    addLanguage({lang}) async {
      final prov = ref.read(userProvider);
      Set<String>? uniqueLanguages;

      if (lang == null) {
        if (user == null || user.profile.languages == null) {
          uniqueLanguages = {_lang.text};
        } else {
          uniqueLanguages = {...?user.profile.languages, _lang.text};
        }
      }

      List<String> languages = lang ?? uniqueLanguages!.toList();

      try {
        final resp = await prov.updateProfile(
          language: languages,
        );
        if (resp.success) {
          _lang.text = "";
          showToast(context, "upload successful");
        } else {
          showToast(context, "unable to add language");
        }
      } catch (err) {
        print(err);
        showToast(context, "unexpected error");
      }
    }

    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                "Add Languages",
                style: textTheme.headlineMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomTextField(
                        controller: _lang,
                        hintText: 'Enter Language',
                      ),
                    ),
                    TextButton(
                      onPressed: addLanguage,
                      child: const Icon(CupertinoIcons.add),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                (user == null || user.profile.languages == null)
                    ? Container()
                    : Wrap(
                        spacing: 20,
                        children: user.profile.languages!
                            .map(
                              (e) => Chip(
                                labelPadding: const EdgeInsets.only(
                                  left: 4,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                label: Text(e),
                                deleteIcon: Icon(Icons.close,
                                    size: 18, color: appTheme.primary1),
                                onDeleted: () {
                                  // user.setSkills = skills.remove(e),
                                  final lang = user.profile.languages;
                                  final filtered = [
                                    ...lang!.where((l) => l != e)
                                  ];
                                  addLanguage(lang: filtered);
                                },
                              ),
                            )
                            .toList(),
                      )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
