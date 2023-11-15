import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FetchTargedtFile {

  Future<File> getFile(String filename) async {
    final path = await _localPatgh;
    return File("$path/$filename");
  }


  Future<String> get _localPatgh async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }

}