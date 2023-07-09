// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      name: json['name'] as String,
      email: json['email'] as String,
      id: json['id'] as int,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      profile: UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
      profile_image: json['profile_image'] as String?,
      experience: (json['experience'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      resume:
          (json['resume'] as List<dynamic>?)?.map((e) => e as String).toList(),
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role]!,
      'profile': instance.profile,
      'profile_image': instance.profile_image,
      'experience': instance.experience,
      'resume': instance.resume,
      'skills': instance.skills,
      'education': instance.education,
    };

const _$RoleEnumMap = {
  Role.JOB_SEEKER: 'JOB_SEEKER',
  Role.EMPLOYER: 'EMPLOYER',
  Role.ADMIN: 'ADMIN',
};

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      about: json['about'] as String?,
      portfolio: json['portfolio'] as String?,
      created: DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'about': instance.about,
      'portfolio': instance.portfolio,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'languages': instance.languages,
      'location': instance.location,
    };

_$_Experience _$$_ExperienceFromJson(Map<String, dynamic> json) =>
    _$_Experience(
      company_name: json['company_name'] as String,
      jobTitle: json['jobTitle'] as String,
      start_date: json['start_date'] as String,
      tasks: json['tasks'] as String,
      end_date: json['end_date'] as String?,
      is_remote: json['is_remote'] as bool?,
      has_completed: json['has_completed'] as bool?,
    );

Map<String, dynamic> _$$_ExperienceToJson(_$_Experience instance) =>
    <String, dynamic>{
      'company_name': instance.company_name,
      'jobTitle': instance.jobTitle,
      'start_date': instance.start_date,
      'tasks': instance.tasks,
      'end_date': instance.end_date,
      'is_remote': instance.is_remote,
      'has_completed': instance.has_completed,
    };

_$_Education _$$_EducationFromJson(Map<String, dynamic> json) => _$_Education(
      program: json['program'] as String,
      institution: json['institution'] as String,
      startDate: json['startDate'] as String,
      end_date: json['end_date'] as String?,
      has_completed: json['has_completed'] as bool?,
    );

Map<String, dynamic> _$$_EducationToJson(_$_Education instance) =>
    <String, dynamic>{
      'program': instance.program,
      'institution': instance.institution,
      'startDate': instance.startDate,
      'end_date': instance.end_date,
      'has_completed': instance.has_completed,
    };
