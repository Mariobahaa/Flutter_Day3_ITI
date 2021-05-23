import 'package:day3/blocs/users_bloc/usersbloc.dart';
import 'package:day3/blocs/users_bloc/usersevents.dart';
import 'package:day3/blocs/users_bloc/usersstate.dart';
import 'package:day3/models/appstate.dart';
import 'package:day3/screens/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:day3/models/user.dart';
import 'package:day3/components/ucard.dart';
import 'package:day3/repos/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPanel extends StatefulWidget {
  UsersPanel({this.title = 'Users'});
  final String title;

  @override
  _UsersPanelState createState() => _UsersPanelState();
}

class _UsersPanelState extends State<UsersPanel> {
  UsersBloc usersBloc;

  Widget _bugrid() {
    return BlocBuilder<UsersBloc, AppState<UsersState>>(
      bloc: usersBloc,
      builder: (context, state) {
        if (state.hasData) {
          return GridView.count(
            padding: EdgeInsets.only(
              top: 12.0,
            ),
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            children: List.generate(
              state.data.usersList.length,
              (index) => UCard(
                  user: state.data.usersList[index],
                  onCardTap: (User user) {
                    usersBloc.add(GetOneUserBlocEvent(userId: user.id));
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider.value(
                          value: usersBloc,
                          child: UserDetails(),
                        );
                      },
                    ));
                    //  -> version 1
                    // print(user);
                    // Navigator.pushNamed(context, '/details',
                    //     arguments: ScreenArguments(
                    //         user: state.data.usersList[index],
                    //         title: '${state.data.usersList[index].name}'));
                  }),
            ),
          );
        } else {
          return Container(
            color: Colors.lightBlue.shade800,
            child: Center(
              child: Text(
                "No data to Show",
                style: TextStyle(
                  color: Colors.cyan.shade100,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _fugrid() {
    return FutureBuilder<List<User>>(
        future: _fusers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              padding: EdgeInsets.only(
                top: 12.0,
              ),
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              children: List.generate(
                snapshot.data.length,
                (index) => UCard(
                    user: snapshot.data[index],
                    onCardTap: (User user) {
                      print(user);
                      Navigator.pushNamed(context, '/details',
                          arguments: ScreenArguments(
                              user: snapshot.data[index],
                              title: '${snapshot.data[index].name}'));
                    }),
              ),
            );
          } else {
            return Container(
              color: Colors.lightBlue.shade800,
              child: Center(
                child: Text(
                  "No data to Show",
                  style: TextStyle(
                    color: Colors.cyan.shade100,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            );
          }
        });
  }

  Widget _ugrid() {
    return GridView.count(
      padding: EdgeInsets.only(
        top: 12.0,
      ),
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      children: List.generate(
        users.length,
        (index) => UCard(
            user: users[index],
            onCardTap: (context) {
              Navigator.pushNamed(context, '/details',
                  arguments: ScreenArguments(
                      user: this.users[index], title: '${users[index].name}'));
            }),
      ),
    );
  }

  Future<List<User>> _fusers;
  List<User> users = [
    User(
        id: 1,
        name: 'mario',
        email: 'mario@mail.com',
        image:
            'https://scontent.fcai2-1.fna.fbcdn.net/v/t1.6435-9/137313633_3926451957400089_5301045380882934606_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=nnz0qEcBNKYAX-AsZOX&_nc_ht=scontent.fcai2-1.fna&oh=84eacfba29779a4b235a95932512c745&oe=60B13557'),
    User(
        id: 2,
        name: 'kiro',
        email: 'kiro@mail.com',
        image:
            'https://scontent.fcai2-2.fna.fbcdn.net/v/t1.6435-9/71655895_2400632676922380_1214663484847947776_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=OrsPFjAYkF0AX_HBLSr&_nc_ht=scontent.fcai2-2.fna&oh=8b585b30672326715fe5fcaffad57a93&oe=60B2C4D1'),
    User(
        id: 3,
        name: 'shika',
        email: 'shika@mail.com',
        image:
            'https://scontent.fcai2-1.fna.fbcdn.net/v/t1.6435-9/176203141_3970076576438900_8554591658607338371_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=Clrk_gYWSo0AX9GZOzG&_nc_ht=scontent.fcai2-1.fna&oh=8527f9abaad674f8f42424608ced88a0&oe=60AFB804'),
    User(
        id: 4,
        name: 'marina',
        email: 'marina@mail.com',
        image:
            'https://scontent.fcai2-2.fna.fbcdn.net/v/t1.6435-9/121973013_1686549058193167_5023298869076830073_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=CYSyvxQ0QkkAX-uNGB6&_nc_ht=scontent.fcai2-2.fna&oh=3d995336ec12bdc4e29f052c0b62b0dc&oe=60B003FA'),
    User(
        id: 5,
        name: 'engy',
        email: 'engy@mail.com',
        image:
            'https://scontent.fcai2-1.fna.fbcdn.net/v/t1.6435-1/p320x320/168487907_1497626423913787_712482871268817817_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=7206a8&_nc_ohc=MSr9eWkV_WoAX8tSUsK&_nc_ht=scontent.fcai2-1.fna&tp=6&oh=c43ddb1c19e68fc9cf90badcd89f809b&oe=60B42098'),
    User(
        id: 6,
        name: 'huda',
        email: 'huda@mail.com',
        image:
            'https://scontent.fcai2-1.fna.fbcdn.net/v/t1.6435-9/169753812_1388650754830206_825016086688372370_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=AkDSFgcN-nkAX85DiNz&_nc_ht=scontent.fcai2-1.fna&oh=f9163808a2cc6876032dbdddd7994a46&oe=60B27A09'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_fusers = UsersRepo().getUsers();
    usersBloc = UsersBloc();
    usersBloc.add(GetAllUsersBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //version 2
          dynamic newUser = Navigator.pushNamed(context, '/create') ?? User();

          //version 1
          //   Navigator.pushNamed(context, '/details',
          //       arguments: ScreenArguments(
          //           user: newUser ?? User(), title: '${newUser?.name}'));
        },
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(child: this._bugrid() //this._fugrid(),
          ),
    );
  }
}
