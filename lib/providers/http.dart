part of skillsage_providers;

class HttpProvider {
  late Dio http;
  HttpProvider()
      : http = Dio(BaseOptions(baseUrl: "http://143.198.235.166:3000/"));

  setToken(String token) {
    http.options.headers["Authorization"] = "Bearer $token";
  }
}
