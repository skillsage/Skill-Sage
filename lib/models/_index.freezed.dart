// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  UserProfile get profile => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  List<Experience>? get experience => throw _privateConstructorUsedError;
  List<String>? get resume => throw _privateConstructorUsedError;
  List<String>? get skills => throw _privateConstructorUsedError;
  List<Education>? get education => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String name,
      String email,
      int id,
      Role role,
      UserProfile profile,
      @JsonKey(name: "profile_image") String? profileImage,
      List<Experience>? experience,
      List<String>? resume,
      List<String>? skills,
      List<Education>? education});

  $UserProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? id = null,
    Object? role = null,
    Object? profile = null,
    Object? profileImage = freezed,
    Object? experience = freezed,
    Object? resume = freezed,
    Object? skills = freezed,
    Object? education = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      resume: freezed == resume
          ? _value.resume
          : resume // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get profile {
    return $UserProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      int id,
      Role role,
      UserProfile profile,
      @JsonKey(name: "profile_image") String? profileImage,
      List<Experience>? experience,
      List<String>? resume,
      List<String>? skills,
      List<Education>? education});

  @override
  $UserProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? id = null,
    Object? role = null,
    Object? profile = null,
    Object? profileImage = freezed,
    Object? experience = freezed,
    Object? resume = freezed,
    Object? skills = freezed,
    Object? education = freezed,
  }) {
    return _then(_$_User(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value._experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      resume: freezed == resume
          ? _value._resume
          : resume // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      education: freezed == education
          ? _value._education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.name,
      required this.email,
      required this.id,
      required this.role,
      required this.profile,
      @JsonKey(name: "profile_image") this.profileImage,
      final List<Experience>? experience,
      final List<String>? resume,
      final List<String>? skills,
      final List<Education>? education})
      : _experience = experience,
        _resume = resume,
        _skills = skills,
        _education = education;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final int id;
  @override
  final Role role;
  @override
  final UserProfile profile;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  final List<Experience>? _experience;
  @override
  List<Experience>? get experience {
    final value = _experience;
    if (value == null) return null;
    if (_experience is EqualUnmodifiableListView) return _experience;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _resume;
  @override
  List<String>? get resume {
    final value = _resume;
    if (value == null) return null;
    if (_resume is EqualUnmodifiableListView) return _resume;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _skills;
  @override
  List<String>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Education>? _education;
  @override
  List<Education>? get education {
    final value = _education;
    if (value == null) return null;
    if (_education is EqualUnmodifiableListView) return _education;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, id: $id, role: $role, profile: $profile, profileImage: $profileImage, experience: $experience, resume: $resume, skills: $skills, education: $education)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            const DeepCollectionEquality()
                .equals(other._experience, _experience) &&
            const DeepCollectionEquality().equals(other._resume, _resume) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._education, _education));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      id,
      role,
      profile,
      profileImage,
      const DeepCollectionEquality().hash(_experience),
      const DeepCollectionEquality().hash(_resume),
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_education));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String name,
      required final String email,
      required final int id,
      required final Role role,
      required final UserProfile profile,
      @JsonKey(name: "profile_image") final String? profileImage,
      final List<Experience>? experience,
      final List<String>? resume,
      final List<String>? skills,
      final List<Education>? education}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  int get id;
  @override
  Role get role;
  @override
  UserProfile get profile;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  List<Experience>? get experience;
  @override
  List<String>? get resume;
  @override
  List<String>? get skills;
  @override
  List<Education>? get education;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String? get about => throw _privateConstructorUsedError;
  String? get portfolio => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime? get updated => throw _privateConstructorUsedError;
  List<String>? get languages => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String? about,
      String? portfolio,
      DateTime created,
      DateTime? updated,
      List<String>? languages,
      String? location});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about = freezed,
    Object? portfolio = freezed,
    Object? created = null,
    Object? updated = freezed,
    Object? languages = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      portfolio: freezed == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? about,
      String? portfolio,
      DateTime created,
      DateTime? updated,
      List<String>? languages,
      String? location});
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about = freezed,
    Object? portfolio = freezed,
    Object? created = null,
    Object? updated = freezed,
    Object? languages = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_UserProfile(
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      portfolio: freezed == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  const _$_UserProfile(
      {this.about,
      this.portfolio,
      required this.created,
      this.updated,
      final List<String>? languages,
      this.location})
      : _languages = languages;

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  final String? about;
  @override
  final String? portfolio;
  @override
  final DateTime created;
  @override
  final DateTime? updated;
  final List<String>? _languages;
  @override
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? location;

  @override
  String toString() {
    return 'UserProfile(about: $about, portfolio: $portfolio, created: $created, updated: $updated, languages: $languages, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.portfolio, portfolio) ||
                other.portfolio == portfolio) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, about, portfolio, created,
      updated, const DeepCollectionEquality().hash(_languages), location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {final String? about,
      final String? portfolio,
      required final DateTime created,
      final DateTime? updated,
      final List<String>? languages,
      final String? location}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  String? get about;
  @override
  String? get portfolio;
  @override
  DateTime get created;
  @override
  DateTime? get updated;
  @override
  List<String>? get languages;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return _Experience.fromJson(json);
}

/// @nodoc
mixin _$Experience {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "company_name")
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: "job_title")
  String get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  String get startDate => throw _privateConstructorUsedError;
  String? get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "is_remote")
  bool? get isRemote => throw _privateConstructorUsedError;
  @JsonKey(name: "has_completed")
  bool? get hasCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExperienceCopyWith<Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
          Experience value, $Res Function(Experience) then) =
      _$ExperienceCopyWithImpl<$Res, Experience>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "company_name") String companyName,
      @JsonKey(name: "job_title") String jobTitle,
      @JsonKey(name: "start_date") String startDate,
      String? tasks,
      @JsonKey(name: "end_date") String? endDate,
      @JsonKey(name: "is_remote") bool? isRemote,
      @JsonKey(name: "has_completed") bool? hasCompleted});
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res, $Val extends Experience>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyName = null,
    Object? jobTitle = null,
    Object? startDate = null,
    Object? tasks = freezed,
    Object? endDate = freezed,
    Object? isRemote = freezed,
    Object? hasCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isRemote: freezed == isRemote
          ? _value.isRemote
          : isRemote // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasCompleted: freezed == hasCompleted
          ? _value.hasCompleted
          : hasCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExperienceCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$$_ExperienceCopyWith(
          _$_Experience value, $Res Function(_$_Experience) then) =
      __$$_ExperienceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "company_name") String companyName,
      @JsonKey(name: "job_title") String jobTitle,
      @JsonKey(name: "start_date") String startDate,
      String? tasks,
      @JsonKey(name: "end_date") String? endDate,
      @JsonKey(name: "is_remote") bool? isRemote,
      @JsonKey(name: "has_completed") bool? hasCompleted});
}

/// @nodoc
class __$$_ExperienceCopyWithImpl<$Res>
    extends _$ExperienceCopyWithImpl<$Res, _$_Experience>
    implements _$$_ExperienceCopyWith<$Res> {
  __$$_ExperienceCopyWithImpl(
      _$_Experience _value, $Res Function(_$_Experience) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyName = null,
    Object? jobTitle = null,
    Object? startDate = null,
    Object? tasks = freezed,
    Object? endDate = freezed,
    Object? isRemote = freezed,
    Object? hasCompleted = freezed,
  }) {
    return _then(_$_Experience(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: freezed == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isRemote: freezed == isRemote
          ? _value.isRemote
          : isRemote // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasCompleted: freezed == hasCompleted
          ? _value.hasCompleted
          : hasCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Experience implements _Experience {
  const _$_Experience(
      {required this.id,
      @JsonKey(name: "company_name") required this.companyName,
      @JsonKey(name: "job_title") required this.jobTitle,
      @JsonKey(name: "start_date") required this.startDate,
      this.tasks,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "is_remote") this.isRemote,
      @JsonKey(name: "has_completed") this.hasCompleted});

  factory _$_Experience.fromJson(Map<String, dynamic> json) =>
      _$$_ExperienceFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "company_name")
  final String companyName;
  @override
  @JsonKey(name: "job_title")
  final String jobTitle;
  @override
  @JsonKey(name: "start_date")
  final String startDate;
  @override
  final String? tasks;
  @override
  @JsonKey(name: "end_date")
  final String? endDate;
  @override
  @JsonKey(name: "is_remote")
  final bool? isRemote;
  @override
  @JsonKey(name: "has_completed")
  final bool? hasCompleted;

  @override
  String toString() {
    return 'Experience(id: $id, companyName: $companyName, jobTitle: $jobTitle, startDate: $startDate, tasks: $tasks, endDate: $endDate, isRemote: $isRemote, hasCompleted: $hasCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Experience &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.tasks, tasks) || other.tasks == tasks) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isRemote, isRemote) ||
                other.isRemote == isRemote) &&
            (identical(other.hasCompleted, hasCompleted) ||
                other.hasCompleted == hasCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, companyName, jobTitle,
      startDate, tasks, endDate, isRemote, hasCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExperienceCopyWith<_$_Experience> get copyWith =>
      __$$_ExperienceCopyWithImpl<_$_Experience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExperienceToJson(
      this,
    );
  }
}

abstract class _Experience implements Experience {
  const factory _Experience(
          {required final int id,
          @JsonKey(name: "company_name") required final String companyName,
          @JsonKey(name: "job_title") required final String jobTitle,
          @JsonKey(name: "start_date") required final String startDate,
          final String? tasks,
          @JsonKey(name: "end_date") final String? endDate,
          @JsonKey(name: "is_remote") final bool? isRemote,
          @JsonKey(name: "has_completed") final bool? hasCompleted}) =
      _$_Experience;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$_Experience.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "company_name")
  String get companyName;
  @override
  @JsonKey(name: "job_title")
  String get jobTitle;
  @override
  @JsonKey(name: "start_date")
  String get startDate;
  @override
  String? get tasks;
  @override
  @JsonKey(name: "end_date")
  String? get endDate;
  @override
  @JsonKey(name: "is_remote")
  bool? get isRemote;
  @override
  @JsonKey(name: "has_completed")
  bool? get hasCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_ExperienceCopyWith<_$_Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  int get id => throw _privateConstructorUsedError;
  String get program => throw _privateConstructorUsedError;
  String get institution => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "has_completed")
  bool? get hasCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
  @useResult
  $Res call(
      {int id,
      String program,
      String institution,
      @JsonKey(name: "start_date") String startDate,
      @JsonKey(name: "end_date") String? endDate,
      @JsonKey(name: "has_completed") bool? hasCompleted});
}

/// @nodoc
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? program = null,
    Object? institution = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? hasCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as String,
      institution: null == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCompleted: freezed == hasCompleted
          ? _value.hasCompleted
          : hasCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$$_EducationCopyWith(
          _$_Education value, $Res Function(_$_Education) then) =
      __$$_EducationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String program,
      String institution,
      @JsonKey(name: "start_date") String startDate,
      @JsonKey(name: "end_date") String? endDate,
      @JsonKey(name: "has_completed") bool? hasCompleted});
}

/// @nodoc
class __$$_EducationCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$_Education>
    implements _$$_EducationCopyWith<$Res> {
  __$$_EducationCopyWithImpl(
      _$_Education _value, $Res Function(_$_Education) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? program = null,
    Object? institution = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? hasCompleted = freezed,
  }) {
    return _then(_$_Education(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as String,
      institution: null == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCompleted: freezed == hasCompleted
          ? _value.hasCompleted
          : hasCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Education implements _Education {
  const _$_Education(
      {required this.id,
      required this.program,
      required this.institution,
      @JsonKey(name: "start_date") required this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "has_completed") this.hasCompleted});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$$_EducationFromJson(json);

  @override
  final int id;
  @override
  final String program;
  @override
  final String institution;
  @override
  @JsonKey(name: "start_date")
  final String startDate;
  @override
  @JsonKey(name: "end_date")
  final String? endDate;
  @override
  @JsonKey(name: "has_completed")
  final bool? hasCompleted;

  @override
  String toString() {
    return 'Education(id: $id, program: $program, institution: $institution, startDate: $startDate, endDate: $endDate, hasCompleted: $hasCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Education &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.institution, institution) ||
                other.institution == institution) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.hasCompleted, hasCompleted) ||
                other.hasCompleted == hasCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, program, institution, startDate, endDate, hasCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      __$$_EducationCopyWithImpl<_$_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EducationToJson(
      this,
    );
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {required final int id,
      required final String program,
      required final String institution,
      @JsonKey(name: "start_date") required final String startDate,
      @JsonKey(name: "end_date") final String? endDate,
      @JsonKey(name: "has_completed") final bool? hasCompleted}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  int get id;
  @override
  String get program;
  @override
  String get institution;
  @override
  @JsonKey(name: "start_date")
  String get startDate;
  @override
  @JsonKey(name: "end_date")
  String? get endDate;
  @override
  @JsonKey(name: "has_completed")
  bool? get hasCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      throw _privateConstructorUsedError;
}
