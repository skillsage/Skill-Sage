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

  final List<String> _ids = [
    'mut8eTdoRxU',
  ];

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
            // const SizedBox(
            //   height: 20,
            // ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player) => Scaffold(
                  appBar: AppBar(
                    // ... app bar properties ...
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.video_library),
                        onPressed: () {
                          // Add your code for the video library action here
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  body: player,
                ),
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
                    children: [
                      ExpansionPanel(
                        backgroundColor: appTheme.scaffold,
                        headerBuilder: (context, isExpanded) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Section1: Introduction",
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
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  ListTile(
                                    minLeadingWidth: 0,
                                    contentPadding: EdgeInsets.zero,
                                    leading: Checkbox(
                                      value: true,
                                      onChanged: (val) => {},
                                    ),
                                    title: const Text(
                                        "1. Introduction to Object Oriented Python"),
                                    subtitle: const Row(
                                      children: [
                                        Icon(CupertinoIcons.play_rectangle,
                                            size: 15),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('7min'),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        isExpanded: false,
                      ),
                      ExpansionPanel(
                        backgroundColor: appTheme.scaffold,
                        headerBuilder: (context, isExpanded) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Section2: Classes and Objects",
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
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  ListTile(
                                    minLeadingWidth: 0,
                                    contentPadding: EdgeInsets.zero,
                                    leading: Checkbox(
                                      value: true,
                                      onChanged: (val) => {},
                                    ),
                                    title: const Text(
                                        "2. Introduction to Object Oriented Python"),
                                    subtitle: const Row(
                                      children: [
                                        Icon(CupertinoIcons.play_rectangle,
                                            size: 15),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('7min'),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        isExpanded: false,
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
