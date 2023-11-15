import 'package:dhabiansomachar/SM/Utilites/Helper/SentWant.dart';
import 'package:dhabiansomachar/SM/JSON_Management/Auth/Credential.dart';
import '../../../Firebase/Auth/FetchCredential.dart';
import '../../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../../ModelClass/LoginFlag.dart';
import '../../../ModelClass/User.dart';

class SendDataToJSon{
  sentAllUsers() async {
    await SentWant().sentAllUsertoJson();

  }
  sentAllPosts() async {
     await SentWant().sentAllPosttoJson();

  }
  sentLogedInUser() async {

    Object uk =  await FetchCredential().findCredential();
    User us = uk as User;
    print(us.country);
    await Credential().saveCredential(us);
  }

  updateUsersAndPosts() async {

    await SendDataToJSon().sentAllPosts();
    await SendDataToJSon().sentAllUsers();
    //SendDataToJSon().sentLogedInUser();
    //SendLoginFlagToJson().login();
  }


}

class SendLoginFlagToJson{

  logout()
  async {
    await LoginFlagJson().saveLoginInfo( LoginFlag(false));
  }
  login() async {
    await LoginFlagJson().saveLoginInfo( LoginFlag(true));
  }
}