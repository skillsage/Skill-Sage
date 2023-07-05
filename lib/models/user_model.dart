part of skillsage_models;

enum Role { JOB_SEEKER, EMPLOYER, ADMIN }

@freezed
class User with _$User {
  const factory User({
    required String name,
    required String email,
    required int id,
    required Role role,
    required UserProfile profile,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? about,
    String? education,
    String? portfolio,
    required DateTime created,
    DateTime? updated,
    required int user_id,
    String? location,
    int? resume_id,
    required int id,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
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
