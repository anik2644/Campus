import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? username;
  String? email;
  String? photoUrl;
  String? country;
  String? bio;
  String? id;
  Timestamp? signedUpAt;
  Timestamp? lastSeen;
  bool? isOnline;


  static List <UserModel> um = [
    UserModel("a", "b", "c", "d", "e", "f", "h"),
    UserModel("a", "b", "c", "d", "e", "f", "h"),
    UserModel("a", "b", "c", "d", "e", "f", "h"),
    UserModel("a", "b", "c", "d", "e", "f", "h"),
    UserModel("a", "b", "c", "d", "e", "f", "h"),


  ];

  UserModel(String a,String b,String c, String d,String e, String f,String h){
    this.username= a;
    this.email=b;
    this.id=c;
    this.photoUrl="https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg";
    this.signedUpAt= Timestamp.now();
    this.isOnline= true;
    this.lastSeen= Timestamp.now();
    this.bio =" desription";
    this.country ="Bangfladesh";
  }

  // UserModel(
  //     {this.username,
  //     this.email,
  //     this.id,
  //     this.photoUrl,
  //     this.signedUpAt,
  //     this.isOnline,
  //     this.lastSeen,
  //     this.bio,
  //     this.country});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    country = json['country'];
    photoUrl = json['photoUrl'];
    signedUpAt = json['signedUpAt'];
    isOnline = json['isOnline'];
    lastSeen = json['lastSeen'];
    bio = json['bio'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['country'] = this.country;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['bio'] = this.bio;
    data['signedUpAt'] = this.signedUpAt;
    data['isOnline'] = this.isOnline;
    data['lastSeen'] = this.lastSeen;
    data['id'] = this.id;
    return data;
  }
}
