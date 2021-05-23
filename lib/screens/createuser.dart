import 'package:day3/repos/users.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  String _name, _job;
  final _formState = GlobalKey<FormState>();
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
      onChanged: (value) {
        if (_saveAndValidate()) _name = value; //mlha4 lazma
      },
      decoration: _getGenericInputDecoration("Name"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Please enter your name";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _jobField() {
    return TextFormField(
      onChanged: (value) {
        if (_saveAndValidate()) _job = value;
      },
      decoration: _getGenericInputDecoration("Job"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Please enter your job title";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _job = value;
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
            print("${_name}");
            ResponseUser user = await UsersRepo().createUser(_name, _job);
            print("${user.name}");
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Success!"),
                  content: Text(
                      "Id: ${user.id}\nname: ${user.name}\n job: ${user.job}\ncreatedAt: ${user.createdAt}"),
                  actions: [
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
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
  }
}

//Task 4
