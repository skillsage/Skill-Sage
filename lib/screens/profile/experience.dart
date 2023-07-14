part of skillsage_screens;

class ExperienceScreen extends ConsumerStatefulWidget {
  const ExperienceScreen({super.key});

  @override
  ConsumerState<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends ConsumerState<ExperienceScreen> {
  final TextEditingController _title = TextEditingController();

  final TextEditingController _company = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _startDate = TextEditingController();

  final TextEditingController _endDate = TextEditingController();

  bool? hasCompleted = false;

  createExperience() async {
    try {
      final prov = ref.read(userProvider.notifier);
      DateTime date = DateTime.parse(DateTime.now().toString());
      final res = await prov.addExperience(
        companyName: _company.text,
        jobTitle: _title.text,
        startDate: _startDate.text,
        endDate: _endDate.text,
        hasCompleted: hasCompleted,
        tasks: _description.text,
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
                  "Work Experience",
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
                      Text(
                        'Job title',
                        style: textTheme.displaySmall,
                      ),
                      CustomTextField(
                        controller: _title,
                      ),
                      Text('Company', style: textTheme.displaySmall),
                      CustomTextField(
                        controller: _company,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Start date',
                                    style: textTheme.displaySmall),
                                CustomTextField(
                                  controller: _startDate,
                                  isDate: true,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'End date',
                                  style: textTheme.displaySmall,
                                ),
                                CustomTextField(
                                  controller: _endDate,
                                  isDate: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: hasCompleted,
                            onChanged: (value) => {
                              setState(() {
                                hasCompleted = value;
                              })
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Text(
                            'I currently work here',
                            style: CustomTextTheme.customTextTheme(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ],
                      ),
                      Text('Tasks', style: textTheme.displaySmall),
                      CustomTextField(
                        controller: _description,
                        maxLine: 6,
                        hintText: 'Write down the tasks performed',
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
                onPressed: createExperience,
              ),
            )
          ],
        ),
      ),
    );
  }
}
