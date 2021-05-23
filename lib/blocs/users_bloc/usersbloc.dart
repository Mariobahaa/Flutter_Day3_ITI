//Bloc
import 'package:bloc/bloc.dart';
import 'package:day3/blocs/users_bloc/usersevents.dart';
import 'package:day3/blocs/users_bloc/usersstate.dart';
import 'package:day3/models/appstate.dart';
import 'package:day3/models/user.dart';
import 'package:day3/repos/users.dart';

class UsersBloc extends Bloc<UsersBlocEvent, AppState<UsersState>> {
  UsersBloc() : super(AppState());

  @override
  Stream<AppState<UsersState>> mapEventToState(UsersBlocEvent event) async* {
    if (event is GetAllUsersBlocEvent) {
      try {
        yield AppState(waiting: true);
        List<User> users = await UsersRepo().getUsers();
        AppState<UsersState> ystate =
            AppState(hasData: true, data: UsersState(usersList: users));
        yield ystate;
      } catch (err) {
        yield AppState(hasError: true, error: err.toString());
      }
    } else if (event is GetOneUserBlocEvent) {
      AppState<UsersState> ystate = AppState(
          hasData: true, data: UsersState(usersList: state.data.usersList));
      ystate.data.selectedUser = state.data.usersList
          .firstWhere((element) => element.id == event.userId);
      yield ystate;
    }
  }
}
