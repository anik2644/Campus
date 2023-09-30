import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'model/UserJsonModel.dart';

class JSONMethods{


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



  Future<List<User>> readFromJSON() async{
    List<User> returnFormantUsers=[];

    try{
      final file = await FetchFile("user.json")._localFile;
      String JsonFilecontents = await file.readAsString();
      final list = json.decode(JsonFilecontents) as List<dynamic> ;

      List<UserJsonModel> JsonFormatUsersList =[];
      JsonFormatUsersList  = list.map((e) => UserJsonModel.fromJson(e)).toList() as List<UserJsonModel>;

      //convert the JSON format User to Actual User and create the return list
      JsonFormatUsersList.forEach((element) {
        User user = User.Complete(element.userName, element.email, element.country!, element.bio!, element.gender!, element.photoUrl!, element.id!,stringToTimestamp(element.lastSeen!) ,stringToBool(element.isOnline!) , stringToTimestamp(element.time!));
        returnFormantUsers.add(user);
      });

      return returnFormantUsers;
    }
    catch(e)
    {
      print(e);
      return returnFormantUsers;
    }
  }

  Future<File> writeToJSON(List<User> listToSendJSON) async{

    List<UserJsonModel> JsonFormatUserList = [];
    listToSendJSON.forEach((element) {
      UserJsonModel JsonFormatUser = UserJsonModel(element.userName, element.email, element.country, element.bio, element.gender, element.photoUrl, element.id, element.lastSeen.toString(), element.isOnline ? 'true' : 'false', element.time.toString());
      JsonFormatUserList.add(JsonFormatUser);
    });


    final file= await FetchFile("user.json")._localFile;
    JsonFormatUserList.map((eachUserInList) => eachUserInList.toJson()).toList();
    var encodedJSONString = json.encode(JsonFormatUserList);
    return file.writeAsString('$encodedJSONString');
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
    print(path.toString());
    print("myPath");
    return File("$path/$filename");
  }

}


