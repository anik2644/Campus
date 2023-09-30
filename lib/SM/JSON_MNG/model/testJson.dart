import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Testjson {
  final String? userName;
  final String? email;

  Testjson(this.userName, this.email);

  Testjson.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        email = json['email']
  ;


  Map<String, dynamic> toJson() => {

    'userName': userName,
    'email':email,
  };
}


class TJM{


  List<Testjson> users=[];
  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }
  Future<File> get _localFile async{
    final path = await _localpath;
    print(path.toString());
    print("myPath");
    return File("$path/test.json");

  }

  Future<Object> readFromJSON() async{
    try{

      final file = await _localFile;
      String contents = await file.readAsString();
      final list = json.decode(contents) as List<dynamic> ;
      List<Testjson> allUser =[];

      print("here is all user");
      print(list.length);
      allUser  = list.map((e) => Testjson.fromJson(e)).toList() as List<Testjson>;
      print(allUser.length);

      for(int i=0; i<allUser.length;i++)
      {
        print(allUser[i].userName);
      }


    //  List<UserJsonModel> Jsonusers = list.map((e) => UserJsonModel.fromJson(e)).toList();


      allUser.forEach((element) {

        Testjson u = Testjson(element.userName, element.email);
        users.add(u);

      });


      print("size of Users is");
      print(users.length);
      return list.map((e) => Testjson.fromJson(e)).toList();;
    }
    catch(e)
    {
      print(e);
      return e.toString();
    }
  }

  Future<File> writeToJSON(List<Testjson> List_users) async{

    List<Testjson> users = [];
    List_users.forEach((element) {

      Testjson uj = Testjson(element.userName, element.email);
      users.add(uj);

    });


    final file= await _localFile;
    print(users.length);
    print("hello done");
    users.map((it_user) => it_user.toJson()).toList();
    print("hello done2");

    var var1 = json.encode(users);

    print(var1.toString());
    print("hello done3");
    return file.writeAsString('$var1');
  }


}
