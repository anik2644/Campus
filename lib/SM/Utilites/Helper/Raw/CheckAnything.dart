import '../../../JSON_Management/Auth/LoginFlagJson.dart';

class CheckAnything{

  Future<bool> isLoggedIn() async {
    bool isloggedin = (await LoginFlagJson().getLoginInfo()).isloggedin;
    return isloggedin;
  }

}