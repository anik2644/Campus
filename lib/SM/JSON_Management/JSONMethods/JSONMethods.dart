import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/JSON_Management/model/ContentJsonModel.dart';
import 'package:dhabiansomachar/SM/ModelClass/Flags.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../../ModelClass/Content.dart';
import '../../ModelClass/Post.dart';
import '../model/FLagsJsonModel.dart';
import '../model/PostJsonModel.dart';
import '../model/UserJsonModel.dart';

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



  Future<List<User>> readFromJSON_user() async{
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

  Future<File> writeToJSON_user(List<User> listToSendJSON) async{

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



  Future<List<Content>> readFromJSON_content() async{


    print("Come to readFromJSON_content");
    List<Content> returnFormantContents=[];

    try{
      final file = await FetchFile("content.json")._localFile;
      String JsonFilecontents = await file.readAsString();

      print(JsonFilecontents);
      final list = json.decode(JsonFilecontents) as List<dynamic> ;

      List<ContentJsonModel> JsonFormatContentList =[];
      JsonFormatContentList  = list.map((e) => ContentJsonModel.fromJson(e)).toList() as List<ContentJsonModel>;

      //convert the JSON format User to Actual User and create the return list
      JsonFormatContentList.forEach((element) {
        print(element.Title);
        Content content= Content(element.AllImagesList, element.ContentImageSequence, element.ContentSegments, element.Location, element.Title);
        returnFormantContents.add(content);
        print(content.Title);
      });

      return returnFormantContents;
    }
    catch(e)
    {
      print(e);
      return returnFormantContents;
    }
  }


  Future<File> writeToJSON_flags(List<Flags> listToSendJSON) async{

    List<FlagsJsonModel> JsonFormatFlagsList = [];
    listToSendJSON.forEach((element) {
      FlagsJsonModel JsonFormatFlag= FlagsJsonModel(element.login);
      JsonFormatFlagsList.add(JsonFormatFlag);
    });


    final file= await FetchFile("flags.json")._localFile;
    JsonFormatFlagsList.map((eachContentInList) => eachContentInList.toJson()).toList();
    var encodedJSONString = json.encode(JsonFormatFlagsList);
    return file.writeAsString('$encodedJSONString');
  }


  Future<List<Flags>> readFromJSON_flags() async{
    List<Flags> returnFormantFlags=[];

    try{
      final file = await FetchFile("flags.json")._localFile;
      String JsonFilecontents = await file.readAsString();
      final list = json.decode(JsonFilecontents) as List<dynamic> ;

      List<FlagsJsonModel> JsonFormatFlagList =[];
      JsonFormatFlagList  = list.map((e) => FlagsJsonModel.fromJson(e)).toList() as List<FlagsJsonModel>;


      JsonFormatFlagList.forEach((element) {
        Flags flags= Flags(element.login);
        returnFormantFlags.add(flags);
      });

      return returnFormantFlags;
    }
    catch(e)
    {
      print(e);
      return returnFormantFlags;
    }
  }

  Future<File> writeToJSON_content(List<Content> listToSendJSON) async{

    List<ContentJsonModel> JsonFormatContentList = [];
    listToSendJSON.forEach((element) {
      ContentJsonModel JsonFormatContent = ContentJsonModel(element.AllImagesList, element.ContentImageSequence, element.ContentSegments, element.Location, element.Title);
      JsonFormatContentList.add(JsonFormatContent);
    });


    final file= await FetchFile("content.json")._localFile;
    JsonFormatContentList.map((eachContentInList) => eachContentInList.toJson()).toList();
    var encodedJSONString = json.encode(JsonFormatContentList);
    return file.writeAsString('$encodedJSONString');
  }

  //for Posts



  Future<List<Post>> readFromJSON_post() async{
    List<Post> returnFormantPosts=[];

    try{
      final file = await FetchFile("post.json")._localFile;
      String JsonFilecontents = await file.readAsString();
      final list = json.decode(JsonFilecontents) as List<dynamic> ;

      List<PostJsonModel> JsonFormatPostList =[];
      JsonFormatPostList  = list.map((e) => PostJsonModel.fromJson(e)).toList() as List<PostJsonModel>;

      //convert the JSON format User to Actual User and create the return list
      JsonFormatPostList.forEach((element) {
        Post post = Post.Complete(element.id, element.postId, element.userName!, element.ownerId!, element.location!, element.timestamp!, element.mediaUrl!,element.description,element.ownerEmail,element.ownerEmail);
        returnFormantPosts.add(post);
      });

      return returnFormantPosts;
    }
    catch(e)
    {
      print(e);
      return returnFormantPosts;
    }
  }

  Future<File> writeToJSON_post(List<Post> listToSendJSON) async{

    List<PostJsonModel> JsonFormatPostList = [];
    listToSendJSON.forEach((element) {
      PostJsonModel JsonFormatPost = PostJsonModel(element.id, element.postId, element.userName!, element.ownerId!, element.location!, element.timestamp!, element.mediaUrl!,element.description,element.ownerEmail,element.ownerPhotoUrl);
      JsonFormatPostList.add(JsonFormatPost);
    });


    final file= await FetchFile("post.json")._localFile;
    JsonFormatPostList.map((eachUserInList) => eachUserInList.toJson()).toList();
    var encodedJSONString = json.encode(JsonFormatPostList);
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
    // print(path.toString());
    // print("myPath");
    return File("$path/$filename");
  }

}


