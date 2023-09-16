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

  Future loadCourses(id) async {
    print(id);
    final resp = await cather(() => http.get('/course/$id'));
    if (!resp.success) return throw Exception("failed");
    notifyListeners();
    return resp;
  }

  Future searchCourse(skill) async {
    final resp = await cather(() => http.get('/course/search/$skill'));
    if (!resp.success) return throw Exception("failed");
    notifyListeners();
    return resp;
  }
}
