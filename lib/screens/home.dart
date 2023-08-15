part of screens;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.appTheme(context);
    return Scaffold(
      backgroundColor: appTheme.bg1,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // disables scrolling
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _buildScreens(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appTheme.primary1,
        currentIndex: _currentIndex,
        selectedItemColor: appTheme.primary2Light,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                CupertinoIcons.home,
                size: 20,
              ),
            ),
            label: '',
            tooltip: 'Home page view of recommended skills',
          ),
          // BottomNavigationBarItem(
          //   icon: Padding(
          //     padding: EdgeInsets.only(top: 8.0),
          //     child: Icon(
          //       CupertinoIcons.briefcase,
          //       size: 20,
          //     ),
          //   ),
          //   label: '',
          //   tooltip: 'Other (Job) recommendations',
          // ),
          // BottomNavigationBarItem(
          //   icon: Padding(
          //     padding: EdgeInsets.only(top: 8.0),
          //     child: Icon(
          //       CupertinoIcons.bookmark,
          //       size: 20,
          //     ),
          //   ),
          //   label: '',
          //   tooltip: 'Bookmarked skills',
          // ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                CupertinoIcons.person,
                size: 20,
              ),
            ),
            label: '',
            tooltip: 'Users\'s profile view',
          )
        ],
      ),
    );
  }

  List<Widget> _buildScreens() {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    final size = MediaQuery.of(context).size;
    final userProv = ref.read(userProvider);
    return <Widget>[
      Column(
        children: [
          const CustomAppHeader(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                //   child: Text("Popular Stacks", style: textTheme.bodyMedium),
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   physics: const BouncingScrollPhysics(),
                //   child: Row(children: [
                //     SkillCard(
                //       title: "React",
                //       subtitle: "JavaScript Library",
                //       description:
                //           "The library for web and native user interfaces. Become a React expert. Start today!",
                //       icon: const Icon(Icons.javascript, size: 20),
                //       width: size.width * 0.77,
                //     ),
                //     SkillCard(
                //       title: "React",
                //       subtitle: "JavaScript Library",
                //       description:
                //           "The library for web and native user interfaces. Become a React expert. Start today!",
                //       icon: const Icon(Icons.javascript, size: 20),
                //       width: size.width * 0.77,
                //     ),
                //   ]),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child:
                      Text("Recommended for you", style: textTheme.bodyMedium),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: (userProv.user != null &&
                          userProv.user!.skills != null &&
                          userProv.user!.skills!.isNotEmpty)
                      ? AdvancedFutureBuilder(
                          future: () => ref
                              .watch(recommenderProvider)
                              .loadRecommendations(),
                          builder: (context, snapshot, _) => ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.result.length,
                            itemBuilder: (_, index) => SkillCard(
                              // icon: ,
                              title: snapshot.result[index],
                              description: "",
                              subtitle: "",
                            ),
                          ),
                          errorBuilder: (context, error, reload) =>
                              Text(error.toString()),
                        )
                      : Center(
                          child: Text("Upload skills to get a recommendation",
                              style: textTheme.bodyMedium),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
      // const JobPostScreen(),
      // const BookmarkScreen(),
      const ProfileScreen(),
    ];
  }
}
