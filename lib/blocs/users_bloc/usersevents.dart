//Events
abstract class UsersBlocEvent {}

class GetAllUsersBlocEvent extends UsersBlocEvent {}

class GetOneUserBlocEvent extends UsersBlocEvent {
  int userId;
  GetOneUserBlocEvent({this.userId});
}
