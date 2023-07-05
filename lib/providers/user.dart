part of skillsage_providers;

class UserProvider extends ChangeNotifier {
  final List<Experience> _experiences = const [
    Experience(
      id: 1,
      companyName: "Fintech Inc.",
      jobTitle: "Software Developer",
      startDate: "Jan 2015",
      endDate: "Feb 2022",
      tasks: "",
    ),
    Experience(
      id: 2,
      companyName: "Hepeps Solutions.",
      jobTitle: "Mobile Application Developer",
      startDate: "Jan 2022",
      endDate: "Dec 2023",
      tasks: "",
    ),
  ];

  List<Skill> _skills = const [
    Skill(id: 1, name: 'Reactjs'),
    Skill(id: 2, name: 'Angular'),
    Skill(id: 3, name: 'MongoDB'),
    Skill(id: 4, name: 'Nodejs')
  ];

  final List<Language> _languages = const [
    Language(id: 1, name: 'English'),
    Language(id: 2, name: 'French'),
    Language(id: 3, name: 'Spanish'),
  ];

  // get user => _user;
  get experiences => _experiences;
  get skills => _skills;
  set setSkills(arr) {
    _skills = arr;
    notifyListeners();
  }

  get languages => _languages;

  // Authentication

  // user
  User? _user;

  get user => _user;

  set user(data) => {
        _user = data,
        notifyListeners(),
      };

  // Loading
  bool _isLoading = false;

  get isLoading => _isLoading;

  set isLoading(value) => {
        _isLoading = value,
        notifyListeners(),
      };

  Future<Map<String, dynamic>> _response(res, {remember, usr}) async {
    if (res["success"] ?? false) {
      isLoading = false;
      await TokenBox.saveToken(res["result"]["token"], remember, usr);
      user = User.fromJson(res["result"]["user"]);
      return res;
    } else {
      isLoading = false;
      return res["detail"];
    }
  }

  // Register
  Future<Map<String, dynamic>> register(
      {name, email, password, rememberMe = false}) async {
    isLoading = true;
    var res = await _networkUtil.postReq('/auth/register', <String, String>{
      "name": name,
      "email": email,
      "password": password,
    });
    return _response(
      res,
      remember: rememberMe,
    );
  }

// Login
  Future<Map<String, dynamic>> login(
      {email, password, rememberMe = false}) async {
    isLoading = true;
    var res = await _networkUtil.postReq('/auth/login', <String, String>{
      "email": email,
      "password": password,
    });
    return _response(
      res,
      remember: rememberMe,
      usr: jsonEncode(res["result"]["user"]),
    );
  }

  void logout() async {
    final tokenData = await TokenBox.getTokenData();
    print("Bearer ${tokenData.token}");
    await TokenBox.deleteToken();
  }

  Future<void> experience() async {
    notifyListeners();
  }

  Future<void> uploadResume({file}) async {
    // await api.uploadFile('/file', file);
    notifyListeners();
  }
}

class TokenBox {
  static Future<void> saveToken(
      String token, bool rememberMe, String user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setBool('rememberMe', rememberMe);
    await prefs.setString('user', user);
  }

  static Future<TokenData> getTokenData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final rememberMe = prefs.getBool('rememberMe') ?? false;
    final user = prefs.getString('user');
    return TokenData(token: token, rememberMe: rememberMe, user: user);
  }

  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('rememberMe');
    await prefs.remove('user');
  }
}

class TokenData {
  final String? token;
  final bool rememberMe;
  final String? user;

  TokenData({
    this.token,
    required this.rememberMe,
    this.user,
  });
}
