part of skillsage_providers;

final userProvider = ChangeNotifierProvider((ref) => UserProvider(ref));

class UserProvider extends ChangeNotifier {
  User? user;
  Ref ref;

  Dio get http => ref.read(httpProvider).http;
  UserProvider(this.ref) {
    init();
  }

  init() {
    http.interceptors.add(InterceptorsWrapper(
      onResponse: (res, handler) {
        if (res.statusCode == 401) {
          print("Unauthorized");
        }

        return handler.next(res);
      },
    ));
  }

  Future<bool> reloadUser() async {
    try {
      final res = await cather(() => http.get("/user/"));
      if (!res.success) return false;
      final data = res.parse(User.fromJson);
      user = data.result;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Resp<User?>> login(String email, String password) async {
    print("logging in");
    final res = await cather(
      () => http.post("/auth/login", data: {
        "email": email,
        "password": password,
      }),
    );

    if (res.success) {
      final token = res.result["token"];
      await ref.read(httpProvider).setToken(token);
      final resp = res.parse((data) => User.fromJson(data["user"]));
      user = resp.result;
      return resp;
    }
    return res.toNull();
  }
}
