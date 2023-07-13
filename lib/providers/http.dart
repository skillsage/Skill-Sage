part of skillsage_providers;

const tokenKey = "user_token";

class HttpProvider {
  late Dio http;
  HttpProvider()
      : http = Dio(BaseOptions(baseUrl: "http://143.198.235.166:3000/")) {
    init();
  }

  init() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString(tokenKey);
    if (token != null) {
      http.options.headers["Authorization"] = "Bearer $token";
    }
  }

  Future setToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    var b = await pref.setString(tokenKey, token);
    print("setting token $b");
    http.options.headers["Authorization"] = "Bearer $token";
  }
}
