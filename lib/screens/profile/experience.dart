part of skillsage_screens;

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final TextEditingController _title = TextEditingController();

  final TextEditingController _company = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _startDate = TextEditingController();

  final TextEditingController _endDate = TextEditingController();

  bool? isCurrent = false;

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
                            value: isCurrent,
                            onChanged: (value) => {
                              setState(() {
                                isCurrent = value;
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
                      Text('Description', style: textTheme.displaySmall),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
