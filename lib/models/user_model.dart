// ignore_for_file: constant_identifier_names, non_constant_identifier_names

part of skillsage_models;

enum Role { JOB_SEEKER, EMPLOYER, ADMIN }

@freezed
class User with _$User {
  const factory User(
      {required String name,
      required String email,
      required int id,
      required Role role,
      required UserProfile profile,
      String? profile_image,
      List<Experience>? experience,
      List<String>? resume,
      List<String>? skills,
      List<Education>? education}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile(
      {String? about,
      String? portfolio,
      required DateTime created,
      DateTime? updated,
      List<String>? languages,
      String? location}) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String company_name,
    required String jobTitle,
    required String start_date,
    required String tasks,
    String? end_date,
    bool? is_remote,
    bool? has_completed,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@freezed
class Education with _$Education {
  const factory Education({
    required String program,
    required String institution,
    required String startDate,
    String? end_date,
    bool? has_completed,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
