part of skillsage_providers;

class UserProvider extends ChangeNotifier {
  // profile
  UserProfile? _profile;
  get profile => _profile;
  set profile(data) => {
        _profile = data,
        notifyListeners(),
      };

  //education
  Education? _education;
  get education => _education;
  set education(data) => {
        _education = data,
        notifyListeners(),
      };

  // experience
  Experience? _experience;
  get experience => _experience;
  set experience(data) => {
        _experience = data,
        notifyListeners(),
      };

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

  // user exists
  bool userExists(res) => res["success"] ?? false;

  //response handler
  Future<Map<String, dynamic>> _response(res, {remember, usr}) async {
    if (userExists(res)) {
      isLoading = false;
      await TokenBox.saveToken(res["result"]["token"], remember, usr);
      print('response: ${res["result"]["user"]}');
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
    if (userExists(res)) {
      return _response(
        res,
        remember: rememberMe,
        usr: jsonEncode(res["result"]["user"]),
      );
    }
    return _response(
      res,
      remember: rememberMe,
    );
  }

  // logout
  void logout() async {
    await TokenBox.deleteToken();
  }

  // update profile
  Future<Map<String, dynamic>> updateProfile(data) async {
    var res = await _networkUtil.putReq('/user/profile', data);
    notifyListeners();
    return res;
  }

  Future<void> updateExperience() async {
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
