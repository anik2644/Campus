
import 'package:dhabiansomachar/SM/Firebase/Users/FBUsersOffice.dart';
import 'package:dhabiansomachar/SM/JSON_Management/Users/JSONUserOffice.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';


import '../../ModelClass/Post.dart';
import '../../Utilites/Helper/Singleton/UserList.dart';

class UsersOffice {
  FBUsersOffice fbUsersOffice = FBUsersOffice();
  JSONUsersOffice jsonUsersOffice = JSONUsersOffice();


  takeDataToRam() async {
    List<User> users = await _fetchUsersFromJSON();

    if (users.isEmpty) {
      users = await _fetchUsersFromFB();
      await jsonUsersOffice.writeToJSON_user(users);
    }
    UserList().setUsers(users);
  }


  Future<List<User>> updateUsers() async {
    List<User> users = await _fetchUsersFromFB();
    await jsonUsersOffice.writeToJSON_user(users);

    return users;
  }


  Future<List<User>> _fetchUsersFromFB() async {
    return await fbUsersOffice.fetchUser();
  }

  Future<List<User>> _fetchUsersFromJSON() async {
    return await jsonUsersOffice.findAllUser();
  }
}
