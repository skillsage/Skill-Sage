part of screens;

class CourseContentScreen extends StatefulWidget {
  const CourseContentScreen({super.key});

  @override
  State<CourseContentScreen> createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  int _selectedCourseIndex = -1;
  List<bool> _isCourseExpanded = List.generate(2, (index) => false);

  final List<String> _ids = ['xi0vhXFPegw', 'mut8eTdoRxU'];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  void playCourse(int index) {
    setState(() {
      if (_selectedCourseIndex == index) {
        _controller.pause();
        _selectedCourseIndex = -1;
      } else {
        _controller.load(_ids[index]);
        _selectedCourseIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: Column(
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
                title: Center(
                  child: Text(
                    "Course Content",
                    style: textTheme.headlineMedium,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bookmark,
                    size: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player) {
                  // Video player at the top
                  return Column(
                    children: [
                      // Play and Pause buttons
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          if (_selectedCourseIndex != -1) {
                            playCourse(_selectedCourseIndex);
                          }
                        },
                      ),
                      // Video player
                      player,
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ExpansionPanelList(
                    animationDuration: const Duration(milliseconds: 1000),
                    dividerColor: appTheme.primary.withOpacity(.4),
                    elevation: 1,
                    expandedHeaderPadding: EdgeInsets.zero,
                    expansionCallback: (int index, bool isExpanded) {
                      // Handle expansion state
                      setState(() {
                        _isCourseExpanded[index] = !isExpanded;
                      });
                    },
                    children: [
                      for (int index = 0; index < _ids.length; index++)
                        ExpansionPanel(
                          backgroundColor: appTheme.scaffold,
                          headerBuilder: (context, isExpanded) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Section ${index + 1}: Introduction",
                                  style: textTheme.headlineMedium,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "0 / 2 | 7min",
                                  style: textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          body: ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, itemIndex) =>
                                GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   // Toggle the expansion state
                                //   _isCourseExpanded[index] =
                                //       !_isCourseExpanded[index];
                                // });

                                print(index);
                                playCourse(index);
                              },
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Column(
                                  children: [
                                    ListTile(
                                      minLeadingWidth: 0,
                                      contentPadding: EdgeInsets.zero,
                                      leading: Checkbox(
                                        value: false,
                                        onChanged: (val) => {},
                                      ),
                                      title: Text(
                                        "${itemIndex + 1}. Introduction to Object Oriented Python",
                                        style: textTheme.labelMedium,
                                      ),
                                      subtitle: Row(
                                        children: [
                                          const Icon(
                                            CupertinoIcons.play_rectangle,
                                            size: 15,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '7min',
                                            style: textTheme.labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          isExpanded: _isCourseExpanded[index],
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
