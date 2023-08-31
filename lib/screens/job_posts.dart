part of screens;

class JobPostScreen extends ConsumerWidget {
  const JobPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: appTheme.scaffold,
            child: ListTile(
              title: Center(
                child: Text(
                  "Job Posts",
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () => showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  color: appTheme.scaffold,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text("Full Stack Engineer",
                          style: textTheme.headlineMedium),
                      const SizedBox(height: 10),
                      ListTile(
                        minLeadingWidth: 0,
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: appTheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        title: Text("Posted by", style: textTheme.labelMedium),
                        subtitle: Text("Fintech", style: textTheme.bodySmall),
                        trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Expiry Date", style: textTheme.labelMedium),
                              Text("Jul 21, 2023", style: textTheme.bodySmall),
                              const SizedBox(height: 10),
                              Text("Ghc3000/year",
                                  style: textTheme.headlineMedium)
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Text("Accra, Ghana", style: textTheme.headlineMedium),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: size.height * .25,
                        child: ListView(shrinkWrap: true, children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Job Description",
                                    style: textTheme.headlineMedium),
                                const SizedBox(height: 10),
                                Text(
                                  "We are looking for a professional who possesses a broad set of skills and expertise in both front-end and back-end development. Must be capable of working on all aspects of a software project, from designing and implementing user interfaces to developing server-side logic and managing databases.",
                                  style: textTheme.bodySmall,
                                )
                              ]),
                          const SizedBox(height: 10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Requirements",
                                    style: textTheme.headlineMedium),
                                const SizedBox(height: 10),
                                Text(
                                  'Educational Qualifications:',
                                  style: textTheme.bodySmall,
                                )
                              ]),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * .4,
                                child: ElevatedButton(
                                    onPressed: () => {},
                                    child: const Text("Apply")),
                              ),
                              SizedBox(
                                width: size.width * .4,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                        color: appTheme.txt,
                                      ),
                                    ),
                                  ),
                                  onPressed: () => {},
                                  child: Text(
                                    "Save",
                                    style: textTheme.bodySmall,
                                  ),
                                ),
                              ),
                              // CustomButton(title: 'Save'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: const JobCard(
              title: "Full Stack Engineer",
              company: "Amalitech",
              location: "Accra, Ghana",
              datePosted: "June 23, 2023",
            ),
          )
        ],
      ),
    );
  }
}
