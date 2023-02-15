import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../databases/hive/hive.dart';
import '../../http/repositories/auth_repositories.dart';
import '../../models/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = await AuthRepositories.getUser();
        UserDB.openBox();
        UserDB.put(user);
        emit(UserLoadedState(user));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
