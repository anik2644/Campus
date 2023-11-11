import '../../../JSON_Management/JSONFile.dart';
import '../../../ModelClass/User.dart';
import '../GetWant.dart';

class UserList {
  final List<User> _users = [];
  static final UserList _singletonUserList = UserList._();

  factory UserList() {
    return _singletonUserList;
  }

  UserList._();

  void addUser(User user) {
    _users.add(user);
  }
  bool isListEmpty() {
    return _users.isEmpty;
  }

  List<User> getUsers() {
    return _users;
  }

   void  setUsers(List<User> userList) {
    _users.clear();
    _users.addAll(userList);
  }

  Future<void> uppdateUsers() async {
    UserList().setUsers( await GetWant().getAllUserfromJson());
  }



}
