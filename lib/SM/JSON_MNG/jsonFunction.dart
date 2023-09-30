import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'model/UserJsonModel.dart';

class JsonMethods{


  List<User> users=[];
  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }
  Future<File> get _localFile async{
    final path = await _localpath;
    print(path.toString());
    print("myPath");
    return File("$path/user.json");

  }

  Future<List<User>> readFromJSON() async{
    try{

      final file = await _localFile;
      String contents = await file.readAsString();
      final list = json.decode(contents) as List<dynamic> ;

      List<UserJsonModel> allUser =[];

      allUser  = list.map((e) => UserJsonModel.fromJson(e)).toList() as List<UserJsonModel>;




/*      for(int i=0; i<allUser.length;i++)
      {
        print(i);
        int seconds = int.parse(allUser[i].time!.split('seconds=')[1].split(', ')[0]);
        int nanoseconds = int.parse(allUser[i].time!.split('nanoseconds=')[1].split(')')[0]);
        Timestamp timestamp = Timestamp(seconds, nanoseconds);
       // print(timestamp.toDate());

        print(allUser[i].isOnline);
        //print(allUser[i].lastSeen);
      }*/




      allUser.forEach((element) {

        int seconds = int.parse(element.lastSeen!.split('seconds=')[1].split(', ')[0]);
        int nanoseconds = int.parse(element.lastSeen!.split('nanoseconds=')[1].split(')')[0]);
        Timestamp LastSeen = Timestamp(seconds, nanoseconds);

        seconds = int.parse(element.time!.split('seconds=')[1].split(', ')[0]);
        nanoseconds = int.parse(element.time!.split('nanoseconds=')[1].split(')')[0]);
        Timestamp Time = Timestamp(seconds, nanoseconds);
        bool ISonline = element.isOnline!.toLowerCase() == 'true';

        User u = User.Complete(element.userName, element.email, element.country!, element.bio!, element.gender!, element.photoUrl!, element.id!,LastSeen ,ISonline , Time);
        users.add(u);

      });



      print("size of Users is");
      print(users.length);
      return users;
    }
    catch(e)
    {
      print(e);
      return users;
      //return e.toString();
    }
  }

  Future<File> writeToJSON(List<User> List_users) async{

    List<UserJsonModel> users = [];
    List_users.forEach((element) {

      UserJsonModel uj = UserJsonModel(element.userName, element.email, element.country, element.bio, element.gender, element.photoUrl, element.id, element.lastSeen.toString(), element.isOnline ? 'true' : 'false', element.time.toString());
      users.add(uj);

    });


    final file= await _localFile;
    print(users.length);
    print("hello done");
    users.map((it_user) => it_user.toJson()).toList();
    print("hello done2");

    var var1 = json.encode(users);

    print(var1.toString());
    print("hello done");
    return file.writeAsString('$var1');
  }


}
