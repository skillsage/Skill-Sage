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
  }

  final TextEditingController _search = TextEditingController();
  String? search = "";
  bool isLoading = false;

  addSkill({id}) async {
    setState(() {
      isLoading = true;
    });
    try {
      // List<int> ids = (filtered == null)
      //     ? [
      //         ...skills!
      //             .where((skill) => userSkills.contains(skill!.name))
      //             .map((skill) => skill!.id)
      //             .toList(),
      //         id
      //       ]
      //     : skills!
      //         .where((skill) => filtered.contains(skill!.name))
      //         .map((skill) => skill!.id)
      //         .toList();

      final res = await ref.read(userProvider).uploadSkills(skills: id);
      if (res.success) {
        setState(() {
          search = "";
          isLoading = false;
        });
        showToast(context, "successful");
        _search.text = "";
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

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);

    final userProv = ref.watch(userProvider);
    User? user = userProv.user;

    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Row(
                    children: [
                      Flexible(
                        child: CustomTextField(
                          controller: _search,
                          // leadingIcon: const Icon(CupertinoIcons.search),
                          hintText: 'Search...',
                          // onChanged: (value) {
                          //   setState(() {
                          //     search = value;
                          //   });
                          // },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () =>
                            userProv.searchSkill(skill: _search.text),
                        child: const Icon(
                          CupertinoIcons.search,
                          size: 20,
                        ),
                      )
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: appTheme.secondary,
                      //   ),
                      //   onPressed: () => {
                      //     userProv.searchSkill(skill: _search.text),
                      //   },
                      //   child: const Text("Search"),
                      // )
                    ],
                  ),
                  const SizedBox(height: 20),
                  _search.text.isNotEmpty
                      ? (isLoading)
                          ? const Center(child: CircularProgressIndicator())
                          : ListView(
                              shrinkWrap: true,
                              children: userProv.skills!
                                  .map(
                                    (e) => InkWell(
                                      onTap: () {
                                        List id = [
                                          ...user!.skills!
                                              .map((skill) => skill["id"]),
                                          e.id
                                        ];
                                        print(id);
                                        addSkill(id: id);
                                      },
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
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      label: Text(e['name'].toString()),
                                      deleteIcon: Icon(Icons.close,
                                          size: 18, color: appTheme.primary1),
                                      onDeleted: () {
                                        final skill = user.skills;
                                        final List id = skill!
                                            .where((l) => l != e)
                                            .map((k) => k["id"])
                                            .toList();
                                        addSkill(id: id);
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
      ),
    );
  }
}
