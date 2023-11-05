import 'package:cloud_firestore/cloud_firestore.dart';

class Content{
  static List<Content> Contents = [];


  List<String> AllImagesList=[];
  List<String> ContentImageSequence =[];
  List<String> ContentSegments =[];
  late String Location;
  late String Title;

/*  final String? id;
  final String? postId;
  final String? userName;
  final String? ownerId;
  late String? location;
  final String? timestamp;
  late String? mediaUrl;
  late String? description;*/

  Content(this.AllImagesList, this.ContentImageSequence, this.ContentSegments, this.Location, this.Title);
  //Content.Complete(this.id, this.postId, this.userName, this.ownerId, this.location, this.timestamp, this.mediaUrl, this.description);



}