import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../../JSON_Management/model/LoginFlagJsonModel.dart';
import 'GetFilePAth.dart';

class FirstTimeCheck{

  Future<bool> _doesFileExist(String filename) async {
    File file = await FetchTargedtFile().getFile(filename);
    return file.exists();
  }

  Future<bool> isFirstTime() async {
    String fname = "loginFlag.json";
    bool fileExists = await _doesFileExist(fname);
    if (fileExists) {
      print("Not First Time");
      return false;
    } else {
      print("First TIme");
      return true;
    }
  }
  Future<void> ifFirstTimeFileCreation() async {

    bool fileExists = await isFirstTime();
    if (!fileExists) {
     print("Dont Need TO Create FIles..");
    } else {
      print("Need TO Create Files...");

     await CreteNecessaryFiles().createNecessaryFiles();
    }

  }

}

class CreteNecessaryFiles{

  Future<void> _createFile(String filename) async {
    final file= await FetchTargedtFile().getFile(filename);

    Uri uri =file.uri;
    print('Created file $uri');


    LoginFlagsJsonModel JsonFormatCheck = LoginFlagsJsonModel('false');
    Map<String, dynamic> loginJsonMap = JsonFormatCheck.toJson();
    var encodedJSONString = json.encode(loginJsonMap);
    file.writeAsString('$encodedJSONString');

  }


  Future<void> createNecessaryFiles() async {


    await _createFile("content.json");
    await _createFile("flags.json");
    await _createFile("credential.json");
    await _createFile("loginFlag.json");
    await _createFile("post.json");
    await _createFile("user.json");


  }





}