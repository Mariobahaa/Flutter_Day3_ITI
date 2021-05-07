import 'package:day3/handlers/services_handler.dart';
import 'package:day3/models/user.dart';
import 'package:day3/screens/createuser.dart';

class UsersRepo {
  String endPoint = "/users";
  Future<List<User>> getUsers() async {
    try {
      dynamic response = await ServicesHandler().httpGet(endPoint);
      Iterable usersList = response['data'];
      List<User> users = usersList.map((user) => User.fromJson(user)).toList();
      return users;
    } catch (error) {
      print("Get users error");
      print(error);
      throw Exception("Error getting users list");
    }
  }

  Future<ResponseUser> createUser(String name, String job) async {
    try {
      dynamic response = await ServicesHandler()
          .httpPost(endPoint: endPoint, body: {"name": name, "job": job});
      //print("${response}");
      ResponseUser user = ResponseUser.fromJson(response);
      return user;
    } catch (error) {
      print("Post user error");
      print(error);
      throw Exception("Error posting user");
    }
  }
}
