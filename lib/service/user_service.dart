part of skillsage_services;

class UserService {
  HttpProvider httpProv;

  UserService(HttpProvider client) : httpProv = client {
    init();
  }

  Dio get http => httpProv.http;

  init() {
    // TODO: GET TOKEN SET THE TOKEN
    httpProv.setToken("token");

    http.interceptors.add(InterceptorsWrapper(
      onResponse: (res, handler) {
        if (res.statusCode == 401) {
          //TODO: sign the user out
          print("Unauthorized");
        }

        return handler.next(res);
      },
    ));
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
      await httpProv.setToken(token);
      final resp = res.parse((data) => User.fromJson(data["user"]));
      return resp;
    }

    return res.toNull();
  }
}
