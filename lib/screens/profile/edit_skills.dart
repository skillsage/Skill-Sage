part of screens;

class EditSkillScreen extends ConsumerStatefulWidget {
  const EditSkillScreen({super.key});

  @override
  ConsumerState<EditSkillScreen> createState() => _EditSkillScreenState();
}

class _EditSkillScreenState extends ConsumerState<EditSkillScreen> {
  @override
  void initState() {
    super.initState();
    loadSkills();
  }

  Future loadSkills() async {
    await ref.read(userProvider).loadSkills();
  }

  // final TextEditingController _search = TextEditingController();
  String? search = "";
  bool isLoading = false;

  addSkill({List<Skills?>? skills, userSkills, id, filtered}) async {
    setState(() {
      isLoading = true;
    });

    try {
      List<int> ids = (filtered == null)
          ? [
              ...skills!
                  .where((skill) => userSkills.contains(skill!.name))
                  .map((skill) => skill!.id)
                  .toList(),
              id
            ]
          : skills!
              .where((skill) => filtered.contains(skill!.name))
              .map((skill) => skill!.id)
              .toList();

      print(ids);
      final res = await ref.read(userProvider).uploadSkills(skills: ids);
      if (res.success) {
        setState(() {
          search = "";
          isLoading = false;
        });
        showToast(context, "successful");
      } else {
        showToast(context, "not successful");
      }
    } catch (err) {
      setState(() {
        search = "";
        isLoading = false;
      });
      print(err);
      showToast(context, "something went wrong");
    } finally {
      setState(() {
        search = "";
        isLoading = false;
      });
    }
  }

  List<Skills?>? _filteredList;

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    final userProv = ref.watch(userProvider);
    User? user = userProv.user;
    List<Skills?>? skills = userProv.skills;

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
                  // controller: _search,
                  leadingIcon: const Icon(CupertinoIcons.search),
                  hintText: 'Search...',
                  onChanged: (value) {
                    setState(() {
                      search = value;
                      _filteredList = (skills != null || skills!.isNotEmpty)
                          ? skills
                              .where((e) => e!.name
                                  .toLowerCase()
                                  .contains(search!.toLowerCase()))
                              .toList()
                          : [];
                    });
                  },
                ),
                const SizedBox(height: 20),
                search!.isNotEmpty
                    ? (isLoading)
                        ? const Center(child: CircularProgressIndicator())
                        : ListView(
                            shrinkWrap: true,
                            children: _filteredList!
                                .map(
                                  (e) => InkWell(
                                    onTap: () => addSkill(
                                        skills: skills,
                                        userSkills: user!.skills,
                                        id: e.id),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 20.0,
                                      ),
                                      child: Text(e!.name,
                                          style: textTheme.bodyMedium),
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
                                    onDeleted: () {
                                      final skill = user.skills;
                                      final filtered = [
                                        ...skill!.where((l) => l != e)
                                      ];
                                      addSkill(
                                          filtered: filtered, skills: skills);
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
