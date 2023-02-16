part of 'user_history_bloc.dart';


@immutable
abstract class UserHistoryEvent extends Equatable {
  const UserHistoryEvent();
}

class LoadUserHistoryEvent extends UserHistoryEvent {
  @override
  List<Object> get props => [];
}


class RemoveUserHistoryEvent extends UserHistoryEvent {
  @override
  List<Object> get props => [];
}