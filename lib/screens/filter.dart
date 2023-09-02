part of screens;

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  RangeValues _values = const RangeValues(100, 1000);
  int? _selectedValue = 0;
  final List<bool?> _selectedCity = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: double.infinity,
                    color: appTheme.bg1,
                    child: ListTile(
                      leading: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          CupertinoIcons.arrow_left,
                          size: 20,
                        ),
                        onPressed: Navigator.of(context).pop,
                      ),
                      title: Center(
                        child: Text(
                          "Filter",
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      trailing: const Text(""),
                    ),
                  ),
                  ExpansionTile(
                    title: Text('Category', style: textTheme.labelMedium),
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          value: "Web",
                          onChanged: (newValue) {
                            setState(() {
                              // dropdownValue = newValue;
                            });
                          },
                          items: <String>['Web', 'Mobile', 'Desktop']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: textTheme.bodySmall),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Location',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  ExpansionTile(
                    title: Text('Salary', style: textTheme.labelMedium),
                    children: <Widget>[
                      RangeSlider(
                        values: _values,
                        onChanged: (RangeValues newValues) {
                          setState(() {
                            _values = newValues;
                          });
                        },
                        min: 0,
                        max: 2000,
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  ExpansionTile(
                    title: Text('Experience', style: textTheme.labelMedium),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          RadioListTile<int>(
                            title: Text('No Experience',
                                style: textTheme.labelSmall),
                            value: 0,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('Less than a year',
                                style: textTheme.labelSmall),
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('1 - 3 years',
                                style: textTheme.labelSmall),
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('More than 3 years',
                                style: textTheme.labelSmall),
                            value: 3,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  ExpansionTile(
                    title: Text('City', style: textTheme.labelMedium),
                    children: <Widget>[
                      CheckboxListTile(
                        title: Text('Accra', style: textTheme.labelSmall),
                        value: _selectedCity[0],
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCity[0] = newValue;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Kumasi', style: textTheme.labelSmall),
                        value: _selectedCity[1],
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCity[1] = newValue;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Takoradi', style: textTheme.labelSmall),
                        value: _selectedCity[2],
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCity[2] = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              title: "Apply Filter",
              color: appTheme.secondary,
            )
          ],
        ),
      ),
    );
  }
}
