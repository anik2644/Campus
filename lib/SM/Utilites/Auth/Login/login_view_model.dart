import 'package:dhabiansomachar/SM/UI/Pages/Feeds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Firebase/Auth/Auth_Service.dart';
import '../../../Firebase/Auth/FetchCredential.dart';
import '../../../JSON_Management/Auth/Credential.dart';
import '../../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../../../ModelClass/LoginFlag.dart';
import '../../../ModelClass/User.dart';
import '../../../UI/Pages/TabScreen.dart';
import '../Validation.dart';

// import 'package:social_media_app/screens/mainscreen.dart';
// import 'package:social_media_app/services/Auth_Service.dart';

class LoginViewModel extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate = false;
  bool loading = false;
  String? email, password;
  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();
  AuthService auth = AuthService();

  login(BuildContext context) async {
    FormState form = formKey.currentState!;
    form.save();
    if (!form.validate()) {
      validate = true;
      notifyListeners();
      showInSnackBar('Please fix the errors in red before submitting.',context);
    } else {
      loading = true;
      notifyListeners();
      try {
        bool success = await auth.loginUser(
          email: email,
          password: password,
        );
        print(success);

        LoginFlagJson().saveLoginInfo( LoginFlag(true));


          Object uk =  await FetchCredential().findCredential();
          User us = uk as User;
          print(us.country);


        LoginCredentials().login(us);
        Credential().saveCredential(us);
        // User us  = await sc.getCredential();
        // print(us.userName);

        // print(lf.isloggedin);







        if (success) {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (_) => TabScreen()));// Feeds()));//TabScreen()));
        }
      } catch (e) {
        loading = false;
        notifyListeners();
        print(e);
        showInSnackBar('${auth.handleFirebaseAuthError(e.toString())}',context);
      }
      loading = false;
      notifyListeners();
    }
  }

  forgotPassword(BuildContext context) async {
    loading = true;
    notifyListeners();
    FormState form = formKey.currentState!;
    form.save();
    print(Validations.validateEmail(email));
    if (Validations.validateEmail(email) != null) {
      showInSnackBar('Please input a valid email to reset your password.',context);
    } else {
      try {
        await auth.forgotPassword(email!);
        showInSnackBar('Please check your email for instructions '
            'to reset your password', context);
      } catch (e) {
        showInSnackBar('${e.toString()}', context);
      }
    }
    loading = false;
    notifyListeners();
  }

  setEmail(val) {
    email = val;
    notifyListeners();
  }

  setPassword(val) {
    password = val;
    notifyListeners();
  }

  void showInSnackBar(String value,context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
