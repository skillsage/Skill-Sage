part of screens;

class CourseContentScreen extends StatefulWidget {
  final Map? content;
  const CourseContentScreen({super.key, this.content});

  @override
  State<CourseContentScreen> createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  String _selectedCourseVideo = '';
  final List<bool> _isCourseExpanded = List.generate(2, (index) => false);

  late List courses;

  @override
  void initState() {
    super.initState();
    courses = widget.content!['items'];
    print(courses);
    _controller = YoutubePlayerController(
      initialVideoId: courses.isEmpty ? '' : courses[0]['sessions'][0]['video'],
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

  void playCourse(String video) {
    setState(() {
      if (_selectedCourseVideo == video) {
        _controller.pause();
        _selectedCourseVideo = "";
      } else {
        _controller.load(video);
        _selectedCourseVideo = video;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final appTheme = AppTheme.appTheme(context);
    return Scaffold(
      backgroundColor: appTheme.bg1,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            CupertinoIcons.arrow_left,
            size: 20,
            color: appTheme.txt,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        title: Center(
          child: Text(
            "Course Content",
            style: textTheme.labelMedium,
          ),
        ),
        elevation: 0,
        backgroundColor: appTheme.scaffold,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bookmark,
              size: 20,
              color: appTheme.txt,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: (courses.isEmpty)
            ? Center(
                child: SizedBox(
                  child: Image.asset("assets/images/not_found.png"),
                ),
              )
            : Column(
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
                                if (_selectedCourseVideo.isNotEmpty) {
                                  playCourse(_selectedCourseVideo);
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
                            for (int index = 0; index < courses.length; index++)
                              ExpansionPanel(
                                backgroundColor: appTheme.scaffold,
                                headerBuilder: (context, isExpanded) =>
                                    Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Section ${index + 1}: ${courses[index]['name']}",
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
                                  itemCount: courses[index]['sessions'].length,
                                  itemBuilder: (context, itemIndex) =>
                                      GestureDetector(
                                    onTap: () {
                                      // setState(() {
                                      //   // Toggle the expansion state
                                      //   _isCourseExpanded[index] =
                                      //       !_isCourseExpanded[index];
                                      // });

                                      print(index);
                                      playCourse(courses[index]['sessions']
                                          [itemIndex]['video']);
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
                                              "${itemIndex + 1}. ${courses[index]['sessions'][itemIndex]['name']}",
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
