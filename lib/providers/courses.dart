part of providers;

final courseProvider = ChangeNotifierProvider((ref) => CourseProvider(ref));

class CourseProvider extends ChangeNotifier {
  Ref ref;

  Dio get http => ref.read(httpProvider).http;
  CourseProvider(this.ref) {
    init();
  }

  init() {
    http.interceptors.add(InterceptorsWrapper(
      onResponse: (res, handler) async {
        if (res.statusCode == 401) {
          print("Unauthorized");
          // await logout();
        }

        return handler.next(res);
      },
    ));
  }

  Future loadCourses() async {
    try {
      final resp = await cather(() => http.get('/course/2'));
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return resp;
    } catch (err) {
      return false;
    }
  }
}
