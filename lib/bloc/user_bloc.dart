import 'package:equatable/equatable.dart';
import 'package:hydrate_bloc_example/data.dart';
import 'package:hydrate_bloc_example/models.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.g.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<UserRequested>(_onUserRequested);
  }

  @override
  String get id => state.user?.id ?? super.id;

  void _onUserRequested(
    UserRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    final user = Data().users.singleWhere(
          (element) => element.id == event.id,
        );
    emit(state.copyWith(user: user, status: UserStatus.success));
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserState.fromJson(json);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toJson();
  }
}
