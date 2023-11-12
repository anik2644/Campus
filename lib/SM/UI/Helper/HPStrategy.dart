import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/JSON_Management/model/LoginFlagJsonModel.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/UpdateWant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:dhabiansomachar/SM/UI/Pages/TabScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../JSON_Management/Auth/Credential.dart';
import '../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../JSON_Management/model/FirstTimeFlagJsonModel.dart';
import '../../ModelClass/LoginCredential.dart';
import '../../ModelClass/LoginFlag.dart';
import '../Pages/Landing.dart';

class HPStretegy extends StatefulWidget {
  @override
  _HPStretegyState createState() => _HPStretegyState();
}


class _HPStretegyState extends State<HPStretegy> with AutomaticKeepAliveClientMixin{

  bool isloggedin = false;
  bool isloading = true;


  @override
  void initState() {

    chekFirstTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading? CircularProgressIndicator():
    isloggedin?
    TabScreen(): //Landing() ://TabScreen(): // Landing() ://Landing() ://
    Landing() ;
  }




  Future<void> alreadyLoggedIn() async {

    isloggedin = (await LoginFlagJson().getLoginInfo()).isloggedin;
    setState(() => isloading = false);

    if(isloggedin) {
      LoginCredentials().login(await Credential().getCredential());
    }
    //print("from already login?");
  }


  @override
  bool get wantKeepAlive => true;

  Future<void> chekFirstTime() async {

    bool firstTime = await _firstTime();
    if (!firstTime) {
      print("Not First");

      setState(() {
        alreadyLoggedIn();
      });
    } else {
      print("First time!");
      await _createFile("content.json");
      await _createFile("flags.json");
      await _createFile("credential.json");
      await _createFile("loginFlag.json");
      await _createFile("post.json");
      await _createFile("user.json");

     await UpdateWant().updateJsonPosts();
     await UpdateWant().updateJsonUsers();
      setState(() {


        // isloading = false;
        // isloggedin = false;
        alreadyLoggedIn();
      });
    }
  }

  Future<void> _createFile(String filename) async {
    final file= await _findFile(filename);

    print(file.path);
    print(file.uri);
    print("ok");

    LoginFlagsJsonModel JsonFormatCheck = LoginFlagsJsonModel('false');
    Map<String, dynamic> loginJsonMap = JsonFormatCheck.toJson();
    var encodedJSONString = json.encode(loginJsonMap);
    file.writeAsString('$encodedJSONString');

  }


  Future<File> _findFile(String filename) async {
    final path = await _localPatgh;
    return File("$path/$filename");
  }

  Future<String> get _localPatgh async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }

  Future<bool> _doesFileExist(String filename) async {
    File file = await _findFile(filename);
    return file.exists();
  }


  Future<bool> _firstTime() async {
    String fname = "loginFlag.json";
    bool fileExists = await _doesFileExist(fname);
    if (fileExists) {
      return false;
    } else {
      return true;
    }
  }

}
