import 'package:day3/screens/createuser.dart';
import 'package:flutter/material.dart';

class CreateBlocState {
  String name, job;
  ResponseUser responseUser;
  //GlobalKey<FormState> formstate;
  CreateBlocState({this.name, this.job, this.responseUser});
}
