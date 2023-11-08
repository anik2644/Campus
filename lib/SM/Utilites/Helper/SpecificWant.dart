import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/UserList.dart';

class SpecificWant{
  
  User specificUser(String id)
  {
    List<User> users= UserList().getUsers();
    //users.forEach((element) {print(element.id);});
    return users.firstWhere((element) => element.id == id);
  }
}

