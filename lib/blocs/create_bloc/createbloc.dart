import 'package:bloc/bloc.dart';
import 'package:day3/blocs/create_bloc/createevents.dart';
import 'package:day3/blocs/create_bloc/createstate.dart';
import 'package:day3/models/appstate.dart';
import 'package:day3/repos/users.dart';
import 'package:day3/screens/createuser.dart';

class CreateBloc extends Bloc<CreateBlocEvent, AppState<CreateBlocState>> {
  CreateBloc() : super(AppState(data: CreateBlocState(name: "", job: "")));

  @override
  Stream<AppState<CreateBlocState>> mapEventToState(
      CreateBlocEvent event) async* {
    // TODO: implement mapEventToState
    //yield AppState(waiting: true);
    if (event is NameChangedBlocEvent) {
      CreateBlocState stateData = state.data;
      // if (_saveAndValidate(state.data.formstate))
      stateData.name = event.value;
      AppState<CreateBlocState> newState =
          AppState(hasData: true, data: stateData);

      yield newState;
    } else if (event is JobChangedBlocEvent) {
      CreateBlocState stateData = state.data;
      // if (_saveAndValidate(state.data.formstate))
      stateData.job = event.value;
      AppState<CreateBlocState> newState =
          AppState(hasData: true, data: stateData);

      yield newState;
    } else if (event is FormSubmitBlocEvent) {
      try {
        print("in Form Submit");
        //yield AppState(waiting: true);
        ResponseUser user =
            await UsersRepo().createUser(state.data.name, state.data.job);
        CreateBlocState stateData = state.data;
        print("User!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print(user.createdAt);
        stateData.responseUser = user;
        AppState<CreateBlocState> newState =
            AppState(hasData: true, data: stateData);

        print(newState.data.responseUser.name);
        yield newState;
      } catch (err) {
        yield AppState(hasError: true, error: err.toString());
      }
    }
  }
}
