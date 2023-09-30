import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  static List<User> users = [];
  final String userName;
  final String email;


  String? country;
  String? bio;
  String? gender;
  String? photoUrl;


  late String id;
  late Timestamp lastSeen;
  late bool isOnline ;
  late Timestamp time;

  User(this.userName, this.email);


  User.Details(this.userName, this.email,String country,String bio,String,gender,String photoUrl)
  {
     this.country = country;
     this.bio = bio;
     this.gender = gender;
     this.photoUrl = photoUrl;
  }

  User.Complete(this.userName, this.email,String country,String bio,String gender,String photoUrl,String id, Timestamp lastSeen,bool isOnline,Timestamp time)
  {
    this.country = country;
    this.bio = bio;
    this.gender = gender;
    this.photoUrl = photoUrl;


    this.id = id;
    this.lastSeen= lastSeen;
    this.isOnline = isOnline;
    this.time =time;
  }



}