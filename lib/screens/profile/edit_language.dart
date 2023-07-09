part of skillsage_screens;

class EditLanguageScreen extends StatelessWidget {
  EditLanguageScreen({super.key});

  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    final user = context.read<UserProvider>();
    List<Language> langs = user.languages;

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
                CustomTextField(
                  controller: _search,
                  leadingIcon: const Icon(CupertinoIcons.search),
                  hintText: 'Search...',
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  children: langs
                      .map(
                        (e) => Chip(
                          labelPadding: const EdgeInsets.only(
                            left: 4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          label: Text(e.name),
                          deleteIcon: Icon(Icons.close,
                              size: 18, color: appTheme.primary1),
                          onDeleted: () => {
                            // user.setSkills = skills.remove(e),
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