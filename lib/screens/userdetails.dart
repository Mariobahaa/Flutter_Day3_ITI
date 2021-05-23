import 'package:day3/blocs/users_bloc/usersbloc.dart';
import 'package:flutter/material.dart';
import 'package:day3/models/user.dart';
import 'package:day3/components/ucard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenArguments {
  final String title;
  final User user;
  ScreenArguments({this.title, this.user});
}

class UserDetails extends StatelessWidget {
  void _printDetails(User user) {
    print(user.toString());
  }

  @override
  Widget build(BuildContext context) {
    final UsersBloc bloc = BlocProvider.of<UsersBloc>(context);
    // final ScreenArguments args =
    //     ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(bloc.state.data.selectedUser.name), //Text(args.title),
      ),
      body: Center(
        child: Container(
          height: 200.0,
          width: 190.0,
          child: UCard(
            user: bloc.state.data.selectedUser,
            onCardTap: _printDetails,
          ),
        ),
      ),
    );
  }
}
