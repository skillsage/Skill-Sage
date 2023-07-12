part of skillsage_services;

class UserService {
  HttpProvider prov;

  UserService(HttpProvider client) : prov = client {
    init();
  }

  Dio get http => prov.http;

  init() {
    // TODO: GET TOKEN SET THE TOKEN
    prov.setToken("token");

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

  FutureOr<T> cather<T>(FutureOr Function() func) async {
    try {
      return await func.call();
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          print(e.response);
          throw RespException("Error");
        }
      }
      rethrow;
    }
  }

  Future<Resp<User>?> login(String email, String password) async {
    final res = await cather(
      () => http.post("/auth/login", data: {
        "email": email,
        "password": password,
      }),
    );

    if (res.data != null) {}

    return null;
  }
}
