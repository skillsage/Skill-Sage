part of providers;

final jobProvider = ChangeNotifierProvider((ref) => JobProvider(ref));

class JobProvider extends ChangeNotifier {
  Ref ref;

  Dio get http => ref.read(httpProvider).http;
  JobProvider(this.ref) {
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

  Future loadJobs() async {
    try {
      final resp = await cather(() => http.get('/job'));
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return resp;
    } catch (err) {
      return false;
    }
  }

  Future<bool> addBookmark({id}) async {
    try {
      final resp = await cather(() => http.post('/job/bookmark/$id'));
      print(resp.success);
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }

  Future loadBookmark() async {
    try {
      final resp = await cather(() => http.get('/job/bookmarks'));
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return resp;
    } catch (err) {
      return false;
    }
  }

  Future<bool> removeBookmark({id}) async {
    print(id);
    try {
      final resp = await cather(() => http.delete('/job/bookmarks/$id'));
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> addApplication({id}) async {
    try {
      final resp = await cather(() => http.post('/job/application/$id'));
      print(resp.success);
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }

  Future loadApplications() async {
    try {
      final resp = await cather(() => http.get('/job/applications'));
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return resp;
    } catch (err) {
      return false;
    }
  }

  Future<bool> removeApplication({id}) async {
    print(id);
    try {
      final resp = await cather(() => http.delete('/job/application/$id'));
      if (!resp.success) return throw Exception("failed");
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }
}
