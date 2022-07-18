part of 'auth_bloc.dart';


@immutable
abstract class UserState extends Equatable{}


class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}


class UserLoadedState extends UserState {
  final UserModel user;

  UserLoadedState(this.user);

  @override
  List<Object?> get props => [user];
}

class UserErrorState extends UserState {
  final String? error;

  UserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}