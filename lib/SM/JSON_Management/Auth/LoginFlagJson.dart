import 'package:dhabiansomachar/SM/JSON_Management/model/LoginFlagJsonModel.dart';
import 'package:dhabiansomachar/SM/ModelClass/LoginFlag.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:io';

class LoginFlagJson{

  Future<File> saveLoginInfo(LoginFlag element) async{

    LoginFlagsJsonModel JsonFormatlogin = LoginFlagsJsonModel( element.isloggedin ? 'true' : 'false');

/*    print("ssssobject1");
    print( JsonFormatlogin.islogin);
    print("ssssobject2");*/
    final file= await FetchFile("loginFlag.json")._localFile;
    Map<String, dynamic> loginJsonMap = JsonFormatlogin.toJson();
    var encodedJSONString = json.encode(loginJsonMap);
    return file.writeAsString('$encodedJSONString');
  }


  Future<LoginFlag> getLoginInfo() async{
    // List<Flags> returnFormantFlags=[];
    LoginFlagsJsonModel JsonFormatlogin ;


    try{


      final file = await FetchFile("loginFlag.json")._localFile;
      String jsonFileContents = await file.readAsString();

   //   print(jsonFileContents);

      final jsonMap = json.decode(jsonFileContents);
      JsonFormatlogin = LoginFlagsJsonModel.fromJson(jsonMap);



      //stringToTimestamp(userJsonModel.lastSeen!)
      LoginFlag loginFlag = LoginFlag(stringToBool(JsonFormatlogin.islogin));
/*
          print("from here: ");
      print(stringToBool(JsonFormatlogin.islogin));
    print(loginFlag.isloggedin);
    print("object");*/

      return loginFlag;
    }
    catch(e)
    {
      print(e);
      return Future.value(null) ;
    }
  }


  bool stringToBool(String? inputString)
  {
  //  String? s = "true";
/*    print("from here: ");
    print(s);
    print("object");*/

    if(inputString!.toLowerCase() == 'true')
      {
        return true;
      }
    else
      {
        return false;
      }

  }


}


class FetchFile{
  final String filename ;
  FetchFile(this.filename);

  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }
  Future<File> get _localFile async{
    final path = await _localpath;
    // print(path.toString());
    //  print("sendingTo");
    return File("$path/$filename");
  }

}