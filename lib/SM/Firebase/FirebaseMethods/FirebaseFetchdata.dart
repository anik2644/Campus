import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../ModelClass/User.dart';

class FirebaseFetchData{

  final String collectionName;
  FirebaseFetchData(this.collectionName);

  Future<List<User>> fetchdata() async {
    if(collectionName == "users")
    {
      List<User> rt= await fetchUser();
      return rt;
    }
    else {
      return [];
    }
  }

  Future<List<User>> fetchUser() async {

    print("hello world");
    CollectionReference collection = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collection.get();


    querySnapshot.docs.forEach((doc) {
      String bio = doc.get('bio');
      String country = doc.get('country');
      String email = doc.get('email');
      String gender = doc.get('gender');
      String id = doc.get('id');
      bool isOnline = doc.get('isOnline');
      Timestamp lastSeen = doc.get('lastSeen');
      String photoUrl = doc.get('photoUrl');
      String userName = doc.get('username');
      Timestamp time =  doc.get('time');


      User curUser = new  User.Complete(userName,email,country,bio,gender,photoUrl,id,lastSeen,isOnline,time);
      bool exists = User.users.any((entity) => entity.email == curUser.email);

      // print(curUser.userName);
      // //print(DateFormat("MMMM d, y 'at' h:mm:ss a 'UTC'z").format(curUser.lastSeen.toDate()).toString());
      // print(curUser.time.toDate());
      if(exists)
      {
        print("already in the list");
      }
      else
      {
        print("not exist in the list");
        User.users.add(curUser);
      }

    });


    print(User.users.length);
/*


    JSONMethods wj = JSONMethods();
    wj.writeToJSON(User.users);

*/

    print("writeDOne");

    return User.users;

  }


}