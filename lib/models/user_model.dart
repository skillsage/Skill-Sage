part of skillsage_models;

enum Role { jobSeeker, employer, admin }

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required Role role,
    String? about,
    String? location,
    String? education,
    int? resumeId,
    String? companyName,
    String? contactInfo,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    required int id,
    required String companyName,
    required String jobTitle,
    required String startDate,
    required String tasks,
    String? endDate,
    bool? isRemote,
    bool? isCompleted,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@freezed
class Skill with _$Skill {
  const factory Skill({
    required int id,
    required String name,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}

@freezed
class Language with _$Language {
  const factory Language({
    required int id,
    required String name,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
