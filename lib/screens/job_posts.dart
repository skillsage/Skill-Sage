part of screens;

class JobPostScreen extends ConsumerWidget {
  const JobPostScreen({super.key});

  add(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.read(jobProvider).addBookmark(id: id);
    if (resp) {
      showToast(context, 'added');
    }
  }

  apply(WidgetRef ref, int id, BuildContext context) async {
    final resp = await ref.read(jobProvider).addApplication(id: id);
    if (resp) {
      showToast(context, 'added');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          // Container(
          //   width: double.infinity,
          //   color: appTheme.scaffold,
          //   child: ListTile(
          //     title: Center(
          //       child: Text(
          //         "Job Posts",
          //         style: textTheme.headlineMedium,
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: CupertinoSearchTextField(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appTheme.light,
              ),
              style: textTheme.titleSmall,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: AdvancedFutureBuilder(
              future: () => ref.watch(jobProvider).loadJobs(),
              builder: (context, snapshot, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.result.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => _buildModal(size, appTheme,
                            textTheme, snapshot.result[index], ref, context),
                      ),
                      child: JobCard(
                        title: snapshot.result[index]['title'],
                        company: snapshot.result[index]['company'] ?? 'Company',
                        location: snapshot.result[index]['location'],
                        datePosted: "Due ${snapshot.result[index]['expiry']}",
                        skills: snapshot.result[index]['skills'],
                        img: snapshot.result[index]['image'],
                      ),
                    );
                  },
                );
              },
              errorBuilder: (context, error, reload) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    error.toString(),
                    style: textTheme.labelSmall,
                  ),
                  TextButton(
                    onPressed: reload,
                    child: const Text("reload"),
                  )
                ],
              ),
              emptyBuilder: (context, reload) => Center(
                child: SizedBox(
                  child: Image.asset("assets/images/not_found.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildModal(size, appTheme, textTheme, data, ref, context) {
    return Container(
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        color: appTheme.scaffold,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(data['title'], style: textTheme.headlineMedium),
            const SizedBox(height: 10),
            ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 60,
                width: 60,
                // padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appTheme.primary,
                  ),
                  image: (data['image'] == null)
                      ? const DecorationImage(
                          image: AssetImage('assets/images/default.jpg'),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: NetworkImage(data['image']),
                          fit: BoxFit.cover,
                        ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              title: Text("Posted by", style: textTheme.labelMedium),
              subtitle: Text("Fintech", style: textTheme.bodySmall),
              trailing:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text("Expiry Date", style: textTheme.labelMedium),
                Text(data['expiry'], style: textTheme.bodySmall),
                const SizedBox(height: 10),
                Text("Ghc${data['salary']}/year",
                    style: textTheme.headlineMedium)
              ]),
            ),
            const SizedBox(height: 10),
            Text(data['location'], style: textTheme.headlineMedium),
            const SizedBox(height: 20),
            SizedBox(
              height: size.height * .25,
              child: ListView(shrinkWrap: true, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Job Description", style: textTheme.headlineMedium),
                  const SizedBox(height: 10),
                  Text(
                    data['description'],
                    style: textTheme.bodySmall,
                  )
                ]),
                const SizedBox(height: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Requirements", style: textTheme.headlineMedium),
                  const SizedBox(height: 10),
                  for (int i = 0; i < data['requirements'].length; i++)
                    Text(
                      data['requirements'][i],
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
                          onPressed: () {
                            apply(ref, data['id'], context);
                            Navigator.pop(context);
                          },
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
                        onPressed: () {
                          add(ref, data['id'], context);
                          Navigator.pop(context);
                        },
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
    );
  }
}
