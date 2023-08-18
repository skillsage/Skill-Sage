// ignore_for_file: constant_identifier_names, non_constant_identifier_names, invalid_annotation_target

part of models;

enum Role { JOB_SEEKER, EMPLOYER, ADMIN }

@freezed
class User with _$User {
  const factory User({
    required String name,
    required String email,
    required int id,
    required Role role,
    required UserProfile profile,
    @JsonKey(name: "profile_image") String? profileImage,
    List<Experience>? experience,
    List<String>? resume,
    List<Map>? skills,
    List<Education>? education,
  }) = _User;

  factory User.fromJson(dynamic json) => _$UserFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? about,
    String? portfolio,
    required DateTime created,
    DateTime? updated,
    List<String>? languages,
    String? location,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class Skills with _$Skills {
  const factory Skills({
    required int id,
    required String name,
  }) = _Skills;

  factory Skills.fromJson(Map<String, dynamic> json) => _$SkillsFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    required int id,
    @JsonKey(name: "company_name") required String companyName,
    @JsonKey(name: "job_title") required String jobTitle,
    @JsonKey(name: "start_date") required String startDate,
    String? tasks,
    @JsonKey(name: "end_date") String? endDate,
    @JsonKey(name: "is_remote") bool? isRemote,
    @JsonKey(name: "has_completed") bool? hasCompleted,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@freezed
class Education with _$Education {
  const factory Education({
    required int id,
    required String program,
    required String institution,
    @JsonKey(name: "start_date") required String startDate,
    @JsonKey(name: "end_date") String? endDate,
    @JsonKey(name: "has_completed") bool? hasCompleted,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
