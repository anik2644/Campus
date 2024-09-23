import 'package:dhabiansomachar/SM/Utilites/Helper/SentWant.dart';
import 'package:dhabiansomachar/SM/JSON_Management/Auth/JSONCredential.dart';
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
    await JSONCredential().saveCredential(us);
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
    await JSONLoginFlag().saveLoginFlag( LoginFlag(false));
  }
  login() async {
    await JSONLoginFlag().saveLoginFlag( LoginFlag(true));
  }
}