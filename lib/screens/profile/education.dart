part of screens;

class EducationScreen extends ConsumerStatefulWidget {
  final Education? education;
  const EducationScreen({super.key, this.education});

  @override
  ConsumerState<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends ConsumerState<EducationScreen> {
  final TextEditingController _program = TextEditingController();

  final TextEditingController _institution = TextEditingController();

  final TextEditingController _startDate = TextEditingController();

  final TextEditingController _endDate = TextEditingController();

  bool? hasCompleted = false;
  bool loading = false;

  handleEducation() async {
    setState(() {
      loading = true;
    });
    try {
      final prov = ref.read(userProvider.notifier);
      final res = (widget.education != null)
          ? await prov.updateEducation(
              id: widget.education!.id,
              program: _program.text,
              institution: _institution.text,
              startDate: _startDate.text,
              endDate: _endDate.text,
              hasCompleted: hasCompleted,
            )
          : await prov.addEducation(
              program: _program.text,
              institution: _institution.text,
              startDate: _startDate.text,
              endDate: _endDate.text,
              hasCompleted: hasCompleted,
            );
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

    final education = widget.education;

    if (education != null) {
      _program.text = education.program;
      _institution.text = education.institution;
      _startDate.text = education.startDate;
      _endDate.text = education.endDate.toString();
      hasCompleted = education.hasCompleted;
    } else {
      print("I am null");
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
                  "Education",
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
                        'Program',
                        style: textTheme.displaySmall,
                      ),
                      CustomTextField(
                        controller: _program,
                      ),
                      Text(
                        'Institution',
                        style: textTheme.displaySmall,
                      ),
                      CustomTextField(
                        controller: _institution,
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
                            'I currently school here',
                            style: CustomTextTheme.customTextTheme(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ],
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
                onPressed: handleEducation,
                isLoading: loading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
