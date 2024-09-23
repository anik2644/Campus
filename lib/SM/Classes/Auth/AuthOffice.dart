import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/Classes/TakeDataToRam.dart';
import 'package:dhabiansomachar/SM/Firebase/Auth/FB_Auth_Service.dart';
import 'package:dhabiansomachar/SM/JSON_Management/JSONOFFICE.dart';
import 'package:path_provider/path_provider.dart';

import '../../Firebase/Auth/FetchCredential.dart';
import '../../JSON_Management/Auth/JSONCredential.dart';
import '../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../Utilites/Constants/firebase.dart';
import 'SingletonCredential.dart';
import '../../ModelClass/LoginFlag.dart';
import '../../ModelClass/User.dart';

class AuthOffice {
  JsonOffice jsonOffice = JsonOffice();

  FBAuthService fbAuthService = FBAuthService();
  JSONCredential jsonCredential = JSONCredential();
  JSONLoginFlag jsonLoginFlag = JSONLoginFlag();



  Future<bool> firstImpression() async {
    bool check = await _alreadyLoggedInCheck();
    if (check) {
      await login();
      return true;
    }
    return false;
  }


  registration() {}

  login() async {
    User user = await _getCrendialfromFB();
    SingletonCredential().login(user);
    await _saveCredentialToJson(user);
    // await _saveLoginFlaglToJson();
  }

  logout() async {
    await firebaseAuth.signOut();
    SingletonCredential().logout();
    await _removeCredentialFromJson();
    //await _removeLoginFlaglfromJson();
  }


  Future<User?> getCurrentCredential() async {
    return SingletonCredential().loggedInUser;
  }

  Future<bool?> isLoggedIn() async {
    return SingletonCredential().isLoggedIn();
  }








  Future<User> _getCrendialfromFB() async {
    return await fbAuthService.getLoginCredential();
  }

  _saveCredentialToJson(User user) async {
    await jsonCredential.saveCredential(user);
  }

  _saveLoginFlaglToJson() async {
    await jsonLoginFlag.saveLoginFlag(LoginFlag(true));
  }

  _removeCredentialFromJson() async {
    await jsonCredential.removeCredential();
  }

  _removeLoginFlaglfromJson() async {
    await jsonLoginFlag.saveLoginFlag(LoginFlag(false));
  }

  // _takeAuthInfoToRam()
  // async {
  //  await takeDataToRam.authData();
  // }

  // Future<bool> _checkLoginFromJson() async {
  //   JSONLoginFlag loginFlagJson = JSONLoginFlag();
  //   bool isloggedininfojson = (await loginFlagJson.getLoginInfo()).isloggedin;
  //   return isloggedininfojson;
  // }

  Future<bool> _alreadyLoggedInCheck() async {
    return await _checkLoginFromJson() || await _checkLoginFromFirebase();
  }



  Future<bool> _checkLoginFromJson() async {
    try {
      var user = await jsonCredential.getCredential();
      if (user is User) {
       // SingletonCredential().login(user);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error checking login from JSON: $e");
      return false;
    }
  }



  Future<bool> _checkLoginFromFirebase() async {
    bool isloggedininfofb = fbAuthService.isUserLoggedIn();
    // if (isloggedininfofb) {
    //   await login();
    // }
    print(isloggedininfofb);

    return isloggedininfofb;
  }
}
