part of skillsage_screens;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                CupertinoIcons.briefcase,
                size: 20,
              ),
            ),
            label: '',
            tooltip: 'Other (Job) recommendations',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                CupertinoIcons.bookmark,
                size: 20,
              ),
            ),
            label: '',
            tooltip: 'Bookmarked skills',
          ),
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
    return <Widget>[
      Column(
        children: [
          const CustomAppHeader(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Text("Popular Stacks", style: textTheme.bodyMedium),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(children: [
                    SkillCard(
                      title: "React",
                      subtitle: "JavaScript Library",
                      description:
                          "The library for web and native user interfaces. Become a React expert. Start today!",
                      icon: const Icon(Icons.javascript, size: 20),
                      width: size.width * 0.77,
                    ),
                    SkillCard(
                      title: "React",
                      subtitle: "JavaScript Library",
                      description:
                          "The library for web and native user interfaces. Become a React expert. Start today!",
                      icon: const Icon(Icons.javascript, size: 20),
                      width: size.width * 0.77,
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child:
                      Text("Recommended for you", style: textTheme.bodyMedium),
                ),
                const SkillCard(
                  title: "React",
                  subtitle: "JavaScript Library",
                  description:
                      "The library for web and native user interfaces. Become a React expert. Start today!",
                  icon: Icon(Icons.javascript_sharp, size: 20),
                ),
                const SkillCard(
                  title: "React",
                  subtitle: "JavaScript Library",
                  description:
                      "The library for web and native user interfaces. Become a React expert. Start today!",
                  icon: Icon(Icons.javascript, size: 20),
                ),
                const SkillCard(
                  title: "React",
                  subtitle: "JavaScript Library",
                  description:
                      "The library for web and native user interfaces. Become a React expert. Start today!",
                  icon: Icon(Icons.javascript, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
      Container(color: Colors.blue),
      Container(color: Colors.green),
      const ProfileScreen(),
    ];
  }
}
