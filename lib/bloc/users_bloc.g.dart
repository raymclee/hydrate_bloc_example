// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersState _$UsersStateFromJson(Map<String, dynamic> json) => UsersState(
      status: $enumDecode(_$UsersStatusEnumMap, json['status']),
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UsersStateToJson(UsersState instance) =>
    <String, dynamic>{
      'users': instance.users,
      'status': _$UsersStatusEnumMap[instance.status]!,
    };

const _$UsersStatusEnumMap = {
  UsersStatus.initial: 'initial',
  UsersStatus.success: 'success',
  UsersStatus.loading: 'loading',
  UsersStatus.failure: 'failure',
};
