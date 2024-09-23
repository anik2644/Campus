import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../Classes/Auth/SingletonCredential.dart';
import '../ModelClass/LoginFlag.dart';
import '../ModelClass/User.dart';
import 'Auth/JSONCredential.dart';
import 'Auth/LoginFlagJson.dart';
import 'model/LoginFlagJsonModel.dart';
import 'package:dhabiansomachar/SM/Firebase/Auth/FB_Auth_Service.dart';


class JsonOffice {

  Future<bool>  fileExist(String filename) async
  {
    File file = await _findFile(filename);
    return file.exists();
  }


  Future<void> createNewFile(String filename) async {
    await _createFile(filename);
  }


  Future<void> createFirstTimeFiles() async {
    await _createFile("content.json");
    await _createFile("flags.json");
    await _createFile("credential.json");
    await _createFile("loginFlag.json");
    await _createFile("post.json");
    await _createFile("user.json");
  }


  Future<void> updateJsonFiles() async {
    // await _updateLoginJsonFlag();
    // await _updateLoginCredential();
  }

  Future<void> _createFile(String filename) async {
    final file = await _findFile(filename); // Locate the file

    print(file.path); // Print file path for debugging
    print(file.uri);  // Print file URI for debugging
    print("File created.");

    await file.writeAsString(''); // Write an empty string to the file
  }



  // Future<void> _createFile(String filename) async {
  //   final file= await _findFile(filename);
  //
  //   print(file.path);
  //   print(file.uri);
  //   print("ok");
  //
  //   LoginFlagsJsonModel JsonFormatCheck = LoginFlagsJsonModel('false');
  //   Map<String, dynamic> loginJsonMap = JsonFormatCheck.toJson();
  //   var encodedJSONString = json.encode(loginJsonMap);
  //   file.writeAsString('$encodedJSONString');
  //
  // }

  Future<File> _findFile(String filename) async {
    final path = await _localPatgh;
    return File("$path/$filename");
  }

  Future<String> get _localPatgh async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }



}




