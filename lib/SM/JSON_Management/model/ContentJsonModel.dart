/*
class ContentJsonModel {


  final List<String> AllImagesList;
  final List<String> ContentImageSequence;
  final List<String> ContentSegments;
  final String Location;
  final String Title;

  ContentJsonModel(this.AllImagesList, this.ContentImageSequence, this.ContentSegments, this.Location, this.Title);

  ContentJsonModel.fromJson(Map<String, dynamic> json)
      : AllImagesList = json['AllImagesList'],
        ContentImageSequence = json['ContentImageSequence'],
        ContentSegments = json['ContentSegments'],
        Location = json['Location'],
        Title = json['Title']

  ;


  Map<String, dynamic> toJson() => {

    'AllImagesList': AllImagesList,
    'ContentImageSequence':ContentImageSequence,
    'ContentSegments':ContentSegments,
    'Location':Location,
    'Title':Title,
  };
}
*/
import '../../ModelClass/Content.dart';

class ContentJsonModel {
  List<Content> contents = [];
  List<String> allImagesList = [];
  List<String> contentImageSequence = [];
  List<String> contentSegments = [];
  late String location;
  late String title;

  ContentJsonModel(this.allImagesList, this.contentImageSequence, this.contentSegments, this.location, this.title);

  // Factory method to create a Content object from JSON
  factory ContentJsonModel.fromJson(Map<String, dynamic> json) {
    return ContentJsonModel(
      List<String>.from(json['allImagesList']),
      List<String>.from(json['contentImageSequence']),
      List<String>.from(json['contentSegments']),
      json['location'],
      json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
    'allImagesList': allImagesList,
    'contentImageSequence': contentImageSequence,
    'contentSegments': contentSegments,
    'location': location,
    'title': title,
  };
}

/*
class Contentt {

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
