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
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role]!,
      'profile': instance.profile,
    };

const _$RoleEnumMap = {
  Role.JOB_SEEKER: 'JOB_SEEKER',
  Role.EMPLOYER: 'EMPLOYER',
  Role.ADMIN: 'ADMIN',
};

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      about: json['about'] as String?,
      education: json['education'] as String?,
      portfolio: json['portfolio'] as String?,
      created: DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      user_id: json['user_id'] as int,
      location: json['location'] as String?,
      resume_id: json['resume_id'] as int?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'about': instance.about,
      'education': instance.education,
      'portfolio': instance.portfolio,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'user_id': instance.user_id,
      'location': instance.location,
      'resume_id': instance.resume_id,
      'id': instance.id,
    };

_$_Experience _$$_ExperienceFromJson(Map<String, dynamic> json) =>
    _$_Experience(
      id: json['id'] as int,
      companyName: json['companyName'] as String,
      jobTitle: json['jobTitle'] as String,
      startDate: json['startDate'] as String,
      tasks: json['tasks'] as String,
      endDate: json['endDate'] as String?,
      isRemote: json['isRemote'] as bool?,
      isCompleted: json['isCompleted'] as bool?,
    );

Map<String, dynamic> _$$_ExperienceToJson(_$_Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'jobTitle': instance.jobTitle,
      'startDate': instance.startDate,
      'tasks': instance.tasks,
      'endDate': instance.endDate,
      'isRemote': instance.isRemote,
      'isCompleted': instance.isCompleted,
    };

_$_Skill _$$_SkillFromJson(Map<String, dynamic> json) => _$_Skill(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_SkillToJson(_$_Skill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_Language _$$_LanguageFromJson(Map<String, dynamic> json) => _$_Language(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_LanguageToJson(_$_Language instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
