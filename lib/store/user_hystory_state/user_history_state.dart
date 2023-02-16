part of 'user_history_bloc.dart';


@immutable
abstract class UserHistoryState extends Equatable{}


class UserHistoryLoadingState extends UserHistoryState {
  @override
  List<Object?> get props => [];
}


class UserHistoryLoadedState extends UserHistoryState {
  final List<UserModel> users;

  UserHistoryLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

class UserHistoryErrorState extends UserHistoryState {
  final String? error;

  UserHistoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
