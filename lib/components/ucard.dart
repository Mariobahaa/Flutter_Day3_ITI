import 'package:flutter/material.dart';
import 'package:day3/models/user.dart';

class UCard extends StatelessWidget {
  final User user;
  final Function onCardTap;
  UCard({this.user, this.onCardTap});
  @override
  Widget build(BuildContext context) {
    //Height
    return GestureDetector(
      onTap: () {
        this.onCardTap(user);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        elevation: 5.0,
        color: Colors.lightBlue.shade800,
        shadowColor: Colors.cyan.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Column(
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                child: CircleAvatar(
                  foregroundImage: NetworkImage(user.image),
                  backgroundImage: AssetImage("assets/userlogo.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  bottom: 4.0,
                ),
                child: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.cyan.shade100,
                  ),
                ),
              ),
              Text(
                user.email,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.cyan.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
