import 'package:cloud_firestore/cloud_firestore.dart';
class UserJsonModel {
  final String userName;
  final String email;


  final  String? country;
  final  String? bio;
  final String? gender;
  final String? photoUrl;


  final String? id;
  final String? lastSeen;
  final String? isOnline ;
  final String? time;


  UserJsonModel(this.userName, this.email, this.country, this.bio, this.gender, this.photoUrl, this.id, this.lastSeen, this.isOnline, this.time);

  UserJsonModel.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        email = json['email'],
        country = json['country'],
        bio = json['bio'],
        gender = json['gender'],
        photoUrl = json['photoUrl'],
        id = json['id'],
        lastSeen = json['lastSeen'] ,
        isOnline = json['isOnline'] ,
        time = json['time']
  ;


  Map<String, dynamic> toJson() => {

    'userName': userName,
     'email':email,
     'country':country,
     'bio':bio,
     'gender':gender,
     'photoUrl':photoUrl,
     'id':id,
     'lastSeen':lastSeen.toString(),
     'isOnline':isOnline ,
     'time':time.toString(),
  };
}