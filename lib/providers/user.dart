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

  Future logout() async {
    await ref.read(httpProvider).removeToken();
    user = null;
  }

  Future<Resp<User?>> register(
      {required String fullname,
      required String email,
      required String password}) async {
    final res = await cather(
      () => http.post(
        "/auth/register",
        data: {
          "name": fullname,
          "password": password,
          "email": email,
        },
      ),
    );
    if (res.success) {
      return login(email, password);
    }
    return res.toNull();
  }
}
