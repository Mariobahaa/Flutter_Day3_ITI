import 'package:day3/blocs/create_bloc/createbloc.dart';
import 'package:day3/blocs/create_bloc/createevents.dart';
import 'package:day3/repos/users.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  //String _name, _job;
  final _formState = GlobalKey<FormState>();
  CreateBloc createBloc;
  // bloc
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBloc = CreateBloc();
    //init bloc
    //init formstate
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formState,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                _nameField(),
                SizedBox(
                  height: 25,
                ),
                _jobField(),
                SizedBox(
                  height: 100,
                ),
                _submitButton()
              ],
            )),
      ),
    );
  }

  bool _saveAndValidate() {
    // try lines in setState ???
    if (_formState.currentState.validate()) {
      _formState.currentState.save();
      return true;
    }
    return false;
  }

  InputDecoration _getGenericInputDecoration(String labelText) {
    return InputDecoration(
      filled: true,
      focusColor: Colors.lightBlue.shade700,
      fillColor: Colors.lightBlue.shade700,
      labelText: labelText,
      focusedBorder: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(),
      border: OutlineInputBorder(),
    );
  }

  Widget _nameField() {
    return TextFormField(
      onChanged: (val) {
        if (_saveAndValidate())
          createBloc.add(NameChangedBlocEvent(value: val));
      },
      decoration: _getGenericInputDecoration("Name"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Please enter your name";
        } else {
          return null;
        }
      },
      onSaved: (String val) {
        createBloc.add(NameChangedBlocEvent(value: val));
        print(createBloc.state.data.job);
      },
    );
  }

  Widget _jobField() {
    return TextFormField(
      onChanged: (val) {
        if (_saveAndValidate()) createBloc.add(JobChangedBlocEvent(value: val));
      },
      decoration: _getGenericInputDecoration("Job"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Please enter your job title";
        } else {
          return null;
        }
      },
      onSaved: (String val) {
        //if (_saveAndValidate())
        createBloc.add(JobChangedBlocEvent(value: val));
      },
    );
  }

  Widget _submitButton() {
    return Container(
      width: 350,
      child: RaisedButton(
        child: Text("Create"),
        onPressed: () async {
          if (_saveAndValidate()) {
            print("Create");
            createBloc.add(FormSubmitBlocEvent());
            print(createBloc.state.data.name);
            // print("${_name}");
            // ResponseUser user = await UsersRepo().createUser(_name, _job);
            // print("${user.name}");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                if (createBloc.state.hasData &&
                    createBloc.state.data.responseUser != null)
                  return AlertDialog(
                    title: Text("Success!"),
                    content: Text(
                        "Id: ${createBloc.state.data.responseUser.id}\nname: ${createBloc.state.data.responseUser.name}\n job: ${createBloc.state.data.responseUser.job}\ncreatedAt: ${createBloc.state.data.responseUser.createdAt}"),
                    actions: [
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                else
                  return SizedBox(
                    height: 0,
                    width: 0,
                  );
              },
            );
          }
        },
      ),
    );
  }
}

class ResponseUser {
  String name, job, id, createdAt;
  ResponseUser.fromJson(Map json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
    print("Created At!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print(createdAt);
  }
}

//Task 4
