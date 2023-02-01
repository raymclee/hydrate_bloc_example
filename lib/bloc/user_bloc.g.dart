// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserState _$UserStateFromJson(Map<String, dynamic> json) => UserState(
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'user': instance.user,
      'status': _$UserStatusEnumMap[instance.status]!,
    };

const _$UserStatusEnumMap = {
  UserStatus.initial: 'initial',
  UserStatus.success: 'success',
  UserStatus.loading: 'loading',
  UserStatus.failure: 'failure',
};
