// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      about: json['about'] as String?,
      location: json['location'] as String?,
      education: json['education'] as String?,
      resumeId: json['resumeId'] as int?,
      companyName: json['companyName'] as String?,
      contactInfo: json['contactInfo'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'about': instance.about,
      'location': instance.location,
      'education': instance.education,
      'resumeId': instance.resumeId,
      'companyName': instance.companyName,
      'contactInfo': instance.contactInfo,
    };

const _$RoleEnumMap = {
  Role.jobSeeker: 'jobSeeker',
  Role.employer: 'employer',
  Role.admin: 'admin',
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
