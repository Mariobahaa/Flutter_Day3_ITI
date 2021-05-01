import 'package:day3/screens/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:day3/models/user.dart';
import 'package:day3/components/ucard.dart';

class UsersPanel extends StatefulWidget {
  UsersPanel({this.title = 'Users'});
  final String title;

  @override
  _UsersPanelState createState() => _UsersPanelState();
}

class _UsersPanelState extends State<UsersPanel> {
  Widget _ugrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      children: List.generate(
        users.length,
        (index) => UCard(
            user: users[index],
            onCardTap: (conteext) {
              Navigator.pushNamed(context, '/details',
                  arguments: ScreenArguments(
                      user: this.users[index], title: '${users[index].name}'));
            }),
      ),
    );
  }

  List<User> users = [
    User(
        id: '1',
        name: 'mario',
        email: 'mario@mail.com',
        image:
            'https://scontent.fcai2-1.fna.fbcdn.net/v/t1.6435-9/137313633_3926451957400089_5301045380882934606_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=nnz0qEcBNKYAX-AsZOX&_nc_ht=scontent.fcai2-1.fna&oh=84eacfba29779a4b235a95932512c745&oe=60B13557'),
    User(
        id: '2',
        name: 'kiro',
        email: 'kiro@mail.com',
        image:
            'https://scontent.fcai2-2.fna.fbcdn.net/v/t1.6435-9/71655895_2400632676922380_1214663484847947776_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=OrsPFjAYkF0AX_HBLSr&_nc_ht=scontent.fcai2-2.fna&oh=8b585b30672326715fe5fcaffad57a93&oe=60B2C4D1'),
    User(
        id: '3',
        name: 'shika',
        email: 'shika@mail.com',
        image:
            'https://scontent.fcai2-1.fna.fbcdn.net/v/t1.6435-9/176203141_3970076576438900_8554591658607338371_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=Clrk_gYWSo0AX9GZOzG&_nc_ht=scontent.fcai2-1.fna&oh=8527f9abaad674f8f42424608ced88a0&oe=60AFB804'),
    User(
        id: '4',
        name: 'marina',
        email: 'marina@mail.com',
        image:
            'https://scontent.fcai2-2.fna.fbcdn.net/v/t1.6435-9/121973013_1686549058193167_5023298869076830073_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=CYSyvxQ0QkkAX-uNGB6&_nc_ht=scontent.fcai2-2.fna&oh=3d995336ec12bdc4e29f052c0b62b0dc&oe=60B003FA'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: this._ugrid(),
      ),
    );
  }
}
