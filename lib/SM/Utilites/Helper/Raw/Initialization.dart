import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FirstTimeCheck{

  Future<File> _findFile(String filename) async {
    final path = await _localPatgh;
    return File("$path/$filename");
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


  Future<String> get _localPatgh async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }

}