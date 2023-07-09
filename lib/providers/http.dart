part of skillsage_providers;

class HttpProvider {
  late Dio client;

  HttpProvider()
      : client = Dio(BaseOptions(
          // TODO: base user
          baseUrl: "",
        )) {
    init();
  }

  init() {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) {
          // option.headers['Authorization'] = 'Bearer ${getToken()}'
        },
      ),
    );
  }

  getToken(String token) {
    client.options.headers["Authorisation"] = token;
  }
}
