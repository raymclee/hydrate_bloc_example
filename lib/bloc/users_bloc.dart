import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrate_bloc_example/data.dart';
import 'package:hydrate_bloc_example/models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.g.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState.initial()) {
    on<UsersRequested>(_onUsersRequested);
  }

  void _onUsersRequested(
    UsersRequested event,
    Emitter<UsersState> emit,
  ) async {
    emit(state.copyWith(status: UsersStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(users: Data().users, status: UsersStatus.success));
  }
}
