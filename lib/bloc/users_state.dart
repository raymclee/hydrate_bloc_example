part of 'users_bloc.dart';

enum UsersStatus { initial, success, loading, failure }

@JsonSerializable()
class UsersState extends Equatable {
  const UsersState({required this.status, this.users = const []});

  final List<User> users;
  final UsersStatus status;

  const UsersState.initial() : this(status: UsersStatus.initial);

  factory UsersState.fromJson(Map<String, dynamic> json) =>
      _$UsersStateFromJson(json);

  @override
  List<Object?> get props => [users, status];

  Map<String, dynamic> toJson() => _$UsersStateToJson(this);

  UsersState copyWith({
    List<User>? users,
    UsersStatus? status,
  }) {
    return UsersState(
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }
}
