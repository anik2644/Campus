import 'package:dhabiansomachar/SM/JSON_Management/Auth/Credential.dart';
import 'package:dhabiansomachar/SM/UI/Helper/HPStrategy.dart';
import 'package:dhabiansomachar/SM/UI/Pages/Feeds.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/UpdateWant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:social_media_app/auth/register/profile_pic.dart';
// import 'package:social_media_app/services/Auth_Service.dart';

import '../../../Firebase/Auth/Auth_Service.dart';
import '../../../Firebase/Auth/FetchCredential.dart';
import '../../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../../../ModelClass/LoginFlag.dart';
import '../../../ModelClass/User.dart' as local;
import '../../../UI/Pages/TabScreen.dart';

/*
class RegisterViewModel extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); //GlobalKey<ScaffoldState>()
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate = false;
  bool loading = false;
  String? username, email, country, password, cPassword;
  FocusNode usernameFN = FocusNode();
  FocusNode emailFN = FocusNode();
  FocusNode countryFN = FocusNode();
  FocusNode passFN = FocusNode();
  FocusNode cPassFN = FocusNode();
  AuthService auth = AuthService();

  register(BuildContext context) async {
    FormState form = formKey.currentState!;
    form.save();
    if (!form.validate()) {
      validate = true;
      notifyListeners();
      showInSnackBar(
          'Please fix the errors in red before submitting.', context);
    } else {
      if (password == cPassword) {
        loading = true;
        notifyListeners();
        try {
          bool success = await auth.createUser(
            name: username,
            email: email,
            password: password,
            country: country,
          );
          print(success);
          if (success) {
            final snackBar = SnackBar(
              content: Text('Signup Done'),
              duration: Duration(seconds: 3), // Optional: Set the duration for the SnackBar
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            /*
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (_) => ProfilePicture(),
              ),
            );
            */
          }
        } catch (e) {
          loading = false;
          notifyListeners();
          print(e);
          showInSnackBar(
              '${auth.handleFirebaseAuthError(e.toString())}', context);
        }
        loading = false;
        notifyListeners();
      } else {
        showInSnackBar('The passwords does not match', context);
      }
    }
  }

  setEmail(val) {
    email = val;
    notifyListeners();
  }

  setPassword(val) {
    password = val;
    notifyListeners();
  }

  setName(val) {
    username = val;
    notifyListeners();
  }

  setConfirmPass(val) {
    cPassword = val;
    notifyListeners();
  }

  setCountry(val) {
    country = val;
    notifyListeners();
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
*/

class RegisterViewModel extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate = false;
  bool loading = false;
  String? username, email, country, password, cPassword;
  FocusNode usernameFN = FocusNode();
  FocusNode emailFN = FocusNode();
  FocusNode countryFN = FocusNode();
  FocusNode passFN = FocusNode();
  FocusNode cPassFN = FocusNode();
  AuthService auth = AuthService();

  register(BuildContext context) async {
    FormState form = formKey.currentState!;
    form.save();
    if (!form.validate()) {
      validate = true;
      notifyListeners();
      showInSnackBar(
          'Please fix the errors in red before submitting.', context);
    } else {
      if (password == cPassword) {
        loading = true;
        notifyListeners();
        try {

          print("here i am");
         local.User success = //true;
         await auth.createUser( name: username, email: email, password: password, country: country, user: extractUser(),);
          print(success);
          if (success.id != "id") {


            LoginFlagJson().saveLoginInfo( LoginFlag(true));

/*

            Object uk =  await FetchCredential().findCredential();
            local.User us = uk as local.User;
            print(us.country);

*/

            UpdateWant().updateJsonUsers();
            local.User us = success ;//extractUser();
            print("dq1");
            LoginCredentials().login(us);
            print("dq");
            Credential().saveCredential(us);
            UpdateWant().updateJsonUsers();
            final snackBar = SnackBar(
              content: Text('signup Done'),
              duration: Duration(seconds: 5),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
           Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (_) => TabScreen(),//Feeds(),//ProfilePicture(),
              ),
            );
          }
        } catch (e) {
          loading = false;
          notifyListeners();
          print(e);
          showInSnackBar(
              '${auth.handleFirebaseAuthError(e.toString())}', context);
        }
        loading = false;
        notifyListeners();
      } else {
        showInSnackBar('The passwords does not match', context);
      }
    }
  }

  local.User extractUser()
  {
    return local.User.Complete(username!, email!, country!, "no bio", "not Specified", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDwmG52pVI5JZfn04j9gdtsd8pAGbqjjLswg&usqp=CAU", "id", Timestamp.now(), true, Timestamp.now());
  }

  setEmail(val) {
    email = val;
    notifyListeners();
  }

  setPassword(val) {
    password = val;
    notifyListeners();
  }

  setName(val) {
    username = val;
    notifyListeners();
  }

  setConfirmPass(val) {
    cPassword = val;
    notifyListeners();
  }

  setCountry(val) {
    country = val;
    notifyListeners();
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
