import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:dhabiansomachar/SM/UI/Components/PostComponents/view_image.dart';
import 'dart:async';
import '../model/UserJsonModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Credential{
  Future<File> saveCredential(User element) async{

      UserJsonModel JsonFormatUser = UserJsonModel(element.userName, element.email, element.country, element.bio, element.gender, element.photoUrl, element.id, element.lastSeen.toString(), element.isOnline ? 'true' : 'false', element.time.toString());

    final file= await FetchFile("credential.json")._localFile;
      Map<String, dynamic> userJsonMap = JsonFormatUser.toJson();
      var encodedJSONString = json.encode(userJsonMap);
    return file.writeAsString('$encodedJSONString');
  }


  Future<User> getCredential() async{
   // List<Flags> returnFormantFlags=[];
    UserJsonModel userJsonModel;


    try{


      final file = await FetchFile("credential.json")._localFile;
      String jsonFileContents = await file.readAsString();
      final jsonMap = json.decode(jsonFileContents);
      userJsonModel = UserJsonModel.fromJson(jsonMap);

      User user = User.Complete(userJsonModel.userName, userJsonModel.email, userJsonModel.country!, userJsonModel.bio!, userJsonModel.gender!, userJsonModel.photoUrl!, userJsonModel.id!, stringToTimestamp(userJsonModel.lastSeen!) ,stringToBool(userJsonModel.isOnline!) , stringToTimestamp(userJsonModel.time!));

      return user;;
    }
    catch(e)
    {
      print(e);
      return Future.value(null) ;
    }
  }

}

Timestamp stringToTimestamp(String? inputString)
{
  int seconds = int.parse(inputString!.split('seconds=')[1].split(', ')[0]);
  int nanoseconds = int.parse(inputString!.split('nanoseconds=')[1].split(')')[0]);
  Timestamp output = Timestamp(seconds, nanoseconds);
  return output;
}
bool stringToBool(String? inputString)
{
  return inputString!.toLowerCase() == 'true';
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