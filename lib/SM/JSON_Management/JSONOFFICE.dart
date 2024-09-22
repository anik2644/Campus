import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'model/LoginFlagJsonModel.dart';

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



}
