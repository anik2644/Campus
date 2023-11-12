import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  static List<User> users = [];


  late String userName;
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


  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return User.Complete(
      data['username'],
      data['email'],
      data['country'],
      data['bio'],
      data['gender'],
      data['photoUrl'],
      data['id'],
      data['lastSeen'],
      data['isOnline'],
      data['time'],
    );
  }


}