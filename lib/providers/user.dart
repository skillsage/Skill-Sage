part of skillsage_providers;

final userProvider = ChangeNotifierProvider((ref) => UserProvider(ref));

class UserProvider extends ChangeNotifier {
  List<Skills?>? skills;
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
      print(res.result["resume"]);
      if (!res.success) return false;
      final data = res.parse(User.fromJson);
      user = data.result;
      notifyListeners();
      return true;
    } catch (e) {
      print('error: $e');
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

  Future<Resp<User?>> updateProfile({
    String? location,
    String? portfolio,
    String? about,
    List<String>? language,
    File? image,
  }) async {
    if (image != null) {
      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });
      final resp = await cather(() => http.post('/user/image', data: formData));
      print(resp);
    }
    final res = await cather(
      () => http.put(
        '/user/profile',
        data: {
          "about": about,
          "location": location,
          "portfolio": portfolio,
          "languages": language,
        },
      ),
    );
    reloadUser();
    return res.toNull();
  }

  Future<Resp<User?>> addExperience({
    required String jobTitle,
    required String companyName,
    required String? startDate,
    String? endDate,
    String? tasks,
    bool? hasCompleted,
  }) async {
    final res = await cather(
      () => http.post(
        '/user/experience',
        data: {
          "job_title": jobTitle,
          "company_name": companyName,
          "start_date": startDate,
          "end_date": endDate,
          "tasks": tasks,
          "has_completed": hasCompleted,
        },
      ),
    );
    reloadUser();
    return res.toNull();
  }

  Future<Resp<User?>> updateExperience({
    required int id,
    required String jobTitle,
    required String companyName,
    required String? startDate,
    String? endDate,
    String? tasks,
    bool? hasCompleted,
  }) async {
    final res = await cather(
      () => http.put(
        '/user/experience',
        data: {
          "id": id,
          "job_title": jobTitle,
          "company_name": companyName,
          "start_date": startDate,
          "end_date": endDate,
          "tasks": tasks,
          "has_completed": hasCompleted,
        },
      ),
    );
    reloadUser();
    return res.toNull();
  }

  Future<Resp<User?>> addEducation({
    required String program,
    required String institution,
    required String? startDate,
    String? endDate,
    bool? hasCompleted,
  }) async {
    final res = await cather(
      () => http.post(
        '/user/education',
        data: {
          "program": program,
          "institution": institution,
          "start_date": startDate,
          "end_date": endDate,
          "has_completed": hasCompleted,
        },
      ),
    );
    reloadUser();
    return res.toNull();
  }

  Future<Resp<User?>> updateEducation({
    required int id,
    required String program,
    required String institution,
    required String? startDate,
    String? endDate,
    bool? hasCompleted,
  }) async {
    final res = await cather(
      () => http.put(
        '/user/education',
        data: {
          "id": id,
          "program": program,
          "institution": institution,
          "start_date": startDate,
          "end_date": endDate,
          "has_completed": hasCompleted,
        },
      ),
    );
    reloadUser();
    return res.toNull();
  }

  Future<Resp<User?>> uploadResume({
    required resume,
  }) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        resume.path,
        filename: resume.path.split('/').last,
      ),
    });
    final resp =
        await cather(() => http.post('/user/upload_resume', data: formData));
    print(resp);

    reloadUser();
    return resp.toNull();
  }

  Future<Resp<User?>> removeResume({url}) async {
    final resp = await cather(() => http.delete('/user/resume', data: {
          "url": url,
        }));
    print('response: $resp');

    reloadUser();
    return resp.toNull();
  }

  Future<bool> loadSkills() async {
    try {
      final resp = await cather(() => http.get('/user/skills'));
      // print('res: ${res.data}');
      if (!resp.success) return throw Exception("failed");
      final Resp<List<Skills?>> data = resp.parseList(Skills.fromJson);
      skills = data.result;
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<Resp<User?>> uploadSkills({
    required List skills,
  }) async {
    final res = await cather(
      () => http.post(
        '/user/skill',
        data: {
          "skills": skills,
        },
      ),
    );
    reloadUser();
    return res.toNull();
  }
}
