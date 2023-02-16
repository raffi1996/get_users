import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../databases/hive/hive.dart';
import '../../models/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_history_state.dart';

part 'user_history_event.dart';

class UserHistoryBloc extends Bloc<UserHistoryEvent, UserHistoryState> {
  UserHistoryBloc() : super(UserHistoryLoadingState()) {
    on<LoadUserHistoryEvent>((event, emit) async {
      emit(UserHistoryLoadingState());
      try {
        final users = await UserDB.get();
        emit(UserHistoryLoadedState(users));
      } catch (e) {
        emit(UserHistoryErrorState(e.toString()));
      }
    });
  }
}
