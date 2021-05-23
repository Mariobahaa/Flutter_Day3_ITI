//Events
abstract class CreateBlocEvent {}

//class InitBlocEvent extends CreateBlocEvent {}

class NameChangedBlocEvent extends CreateBlocEvent {
  String value;
  NameChangedBlocEvent({this.value});
}

class JobChangedBlocEvent extends CreateBlocEvent {
  String value;
  JobChangedBlocEvent({this.value});
}

class FormSubmitBlocEvent extends CreateBlocEvent {}
