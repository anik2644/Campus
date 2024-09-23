
import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/JSON_Management/model/ContentJsonModel.dart';
import 'package:dhabiansomachar/SM/ModelClass/Flags.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../../ModelClass/Content.dart';
import '../../ModelClass/Post.dart';
import '../model/FLagsJsonModel.dart';
import '../model/PostJsonModel.dart';
/*class Contentt {
  List<Content> contents = [];
  List<String> allImagesList = [];
  List<String> contentImageSequence = [];
  List<String> contentSegments = [];
  late String location;
  late String title;

  Contentt(this.allImagesList, this.contentImageSequence, this.contentSegments, this.location, this.title);

  // Factory method to create a Content object from JSON
  factory Contentt.fromJson(Map<String, dynamic> json) {
    return Contentt(
      List<String>.from(json['allImagesList']),
      List<String>.from(json['contentImageSequence']),
      List<String>.from(json['contentSegments']),
      json['location'],
      json['title'],
    );
  }
}*/
import '../model/UserJsonModel.dart';

class JSONContentsOffice{


/*

  Future<List<Content>> readFromJSON_content() async {
    print("Come to readFromJSON_content");
    List<Content> returnFormantContents = [];

    try {
      // Fetch the file
      final file = await FetchFile("content.json")._localFile;

      // Read the file content as a string
      String jsonFileContents = await file.readAsString();
      print(jsonFileContents);

      // Decode the JSON string into a map
      final Map<String, dynamic> decodedData = json.decode(jsonFileContents) as Map<String, dynamic>;

      // Check if the 'contents' key exists and is a list
      if (decodedData.containsKey('contents') && decodedData['contents'] is List) {
        // Extract the list of content JSON objects
        final List<dynamic> contentListJson = decodedData['contents'];

        // Deserialize each JSON object into a ContentJsonModel and then into a Content object
        List<ContentJsonModel> jsonFormatContentList = contentListJson
            .map((e) => ContentJsonModel.fromJson(e))
            .toList();

        // Convert the JSON format objects to actual Content objects
        jsonFormatContentList.forEach((element) {
          print(element.title);
          Content content = Content(
            element.allImagesList,
            element.contentImageSequence,
            element.contentSegments,
            element.location,
            element.title,
          );
          returnFormantContents.add(content);
          print(content.Title);
        });
      }

      // Return the list of Content objects
      return returnFormantContents;
    } catch (e) {
      print(e);
      return returnFormantContents; // Return an empty list in case of an error
    }
  }

*/



  Timestamp stringToTimestamp(String? inputString)
  {
    int seconds = int.parse(inputString!.split('seconds=')[1].split(', ')[0]);
    int nanoseconds = int.parse(inputString!.split('nanoseconds=')[1].split(')')[0]);
    Timestamp output = Timestamp(seconds, nanoseconds);
    return output;
  }

/*

  Future<List<Content>> readFromJSON_content() async {

    List<Content> returnFormantContents = [];
    final file = await FetchFile("content.json")._localFile;

    // Read the file content as a string
    String jsonFileContents = await file.readAsString();
    print(jsonFileContents);

    // Decode the JSON string
    final List<dynamic> jsonList = json.decode(jsonFileContents);

    // Convert JSON list to List<Content>
    List<ContentJsonModel> contents = jsonList.map((json) => ContentJsonModel.fromJson(json)).toList();

    contents.forEach((element) {
     // print(element.title);
      Content content = Content(
        element.allImagesList,
        element.contentImageSequence,
        element.contentSegments,
        element.location,
        element.title,
      );
      returnFormantContents.add(content);
      print(content.Title);
    });
    return returnFormantContents;
  }

*/





  Future<List<Content>> readFromJSON_content() async {
    List<Content> returnFormantContents = [];
    final file = await FetchFile("content.json")._localFile;

    try {
      // Read the file content as a string
      String jsonFileContents = await file.readAsString();

      // Check if the file is empty
      if (jsonFileContents.isEmpty) {
        print("The JSON file is empty.");
        return returnFormantContents; // Return an empty list
      }

      // Decode the JSON string
      final List<dynamic> jsonList = json.decode(jsonFileContents);

      // Convert JSON list to List<ContentJsonModel>
      List<ContentJsonModel> contents = jsonList.map((json) => ContentJsonModel.fromJson(json)).toList();

      // Convert to List<Content>
      for (ContentJsonModel element in contents) {
        Content content = Content(
          element.allImagesList,
          element.contentImageSequence,
          element.contentSegments,
          element.location,
          element.title,
        );
        returnFormantContents.add(content);
        // print('Title: ${content.Title}');
      }
    } catch (e) {
      print("Error reading JSON file: $e");
    }

    return returnFormantContents;
  }


  bool stringToBool(String? inputString)
  {
    return inputString!.toLowerCase() == 'true';
  }


  Future<File> writeToJSON_content(List<Content> listToSendJSON) async {
    // Fetch the local file where you want to write the content
    final file = await FetchFile("content.json")._localFile;

    // Create a list to hold content data in map format
    List<Map<String, dynamic>> contentList = [];

    listToSendJSON.forEach((content) {
      contentList.add({
        'title': content.Title,
        'location': content.Location,
        'allImagesList': content.AllImagesList,
        'contentImageSequence': content.ContentImageSequence,
        'contentSegments': content.ContentSegments,
      });
    });

    // Convert the list of contents to a JSON string directly
    String jsonString = jsonEncode(contentList);

    // Write the JSON string to the file
    return file.writeAsString(jsonString);
  }

/*

  revised code


  Future<File> writeToJSON_content(List<Content> listToSendJSON) async {
    // Fetch the local file where you want to write the content
    final file = await FetchFile("content.json")._localFile;

    // Create a list to hold content data in map format
    List<Map<String, dynamic>> contentList = [];

    listToSendJSON.forEach((content) {
      contentList.add({
        'title': content.Title,
        'location': content.Location,
        'allImagesList': content.AllImagesList,
        'contentImageSequence': content.ContentImageSequence,
        'contentSegments': content.ContentSegments
      });
    });

    // Create a map to hold the list of contents
    Map<String, dynamic> jsonData = {
      'contents': contentList,
    };

    // Convert the map to a JSON string
    String jsonString = jsonEncode(jsonData);

    // Write the JSON string to the file
    return file.writeAsString(jsonString);
  }
*/


/*

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

*/


/*

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

*/

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


