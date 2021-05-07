import 'package:flutter/material.dart';
import 'package:day3/models/user.dart';
import 'package:day3/components/ucard.dart';

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
    final ScreenArguments args =
        ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Container(
          height: 200.0,
          width: 190.0,
          child: UCard(
            user: args.user,
            onCardTap: _printDetails,
          ),
        ),
      ),
    );
  }
}
