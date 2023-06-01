import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? id;
  String? postId;
  String? ownerId;
  String? username;
  String? location;
  String? description;
  String? mediaUrl;
  Timestamp? timestamp;


  PostModel(String a,String b,String c, String d,String e, String f,String h){
    this.id =a;
    this.postId =b;
    this.ownerId =c;
    this.location =d;
    this.username =e;
    this.description =f;
    this.timestamp = timestamp;
    this.mediaUrl = h;// "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg";
  }

  // PostModel({
  //   this.id,
  //   this.postId,
  //   this.ownerId,
  //   this.location,
  //   this.description,
  //   this.mediaUrl,
  //   this.username,
  //   this.timestamp,
  // });
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    ownerId = json['ownerId'];
    location = json['location'];
    username= json['username'];
    description = json['description'];
    mediaUrl = json['mediaUrl'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['postId'] = this.postId;
    data['ownerId'] = this.ownerId;
    data['location'] = this.location;
    data['description'] = this.description;
    data['mediaUrl'] = this.mediaUrl;

    data['timestamp'] = this.timestamp;
    data['username'] = this.username;
    return data;
  }
}
