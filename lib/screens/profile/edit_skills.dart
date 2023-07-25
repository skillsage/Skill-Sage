part of skillsage_screens;

class EditSkillScreen extends ConsumerStatefulWidget {
  const EditSkillScreen({super.key});

  @override
  ConsumerState<EditSkillScreen> createState() => _EditSkillScreenState();
}

class _EditSkillScreenState extends ConsumerState<EditSkillScreen> {
  final TextEditingController _search = TextEditingController();
  String? search = "";
  final List<String> _searchResults = ["React", "Python", "JavaScript"];

  List<String>? _filteredList;

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    User? user = ref.watch(userProvider.notifier).user;

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
                "Add Skills",
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
                  onChanged: (value) {
                    setState(() {
                      search = value;
                      _filteredList = _searchResults
                          .where((e) =>
                              e.toLowerCase().contains(search!.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                const SizedBox(height: 20),
                search!.isNotEmpty
                    ? ListView(
                        shrinkWrap: true,
                        children: _filteredList!
                            .map(
                              (e) => InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20.0,
                                  ),
                                  child: Text(e, style: textTheme.bodyMedium),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : (user == null || user.skills!.isEmpty)
                        ? Container()
                        : Wrap(
                            spacing: 20,
                            children: user.skills!
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
