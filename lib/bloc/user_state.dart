// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

enum UserStatus { initial, success, loading, failure }

@JsonSerializable()
class UserState extends Equatable {
  const UserState({required this.status, this.user});

  final User? user;
  final UserStatus status;

  const UserState.initial() : this(status: UserStatus.initial);

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  @override
  List<Object?> get props => [user, status];

  UserState copyWith({
    User? user,
    UserStatus? status,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() => _$UserStateToJson(this);

  @override
  bool get stringify => true;
}
