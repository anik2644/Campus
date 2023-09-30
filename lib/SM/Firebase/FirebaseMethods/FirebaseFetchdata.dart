import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';

class FirebaseFetchData{

  final String collectionName;
  FirebaseFetchData(this.collectionName);

  Future<List<Object>> fetchdata() async {
    if(collectionName == "users")
    {
      List<User> rt= await fetchUser();
      return rt as List<User>;
    }
    else if(collectionName == "posts")
    {
      List<Post> rt= await fetchPost();
      return rt as List<Post>;
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

  Future<List<Post>> fetchPost() async {

    print("Post Fetching");
    CollectionReference collection = FirebaseFirestore.instance.collection('all_Posts');
    QuerySnapshot querySnapshot = await collection.get();


    querySnapshot.docs.forEach((doc) {

 /*     String bio = doc.get('bio');
      String country = doc.get('country');
      String email = doc.get('email');
      String gender = doc.get('gender');
      String id = doc.get('id');
      bool isOnline = doc.get('isOnline');
      Timestamp lastSeen = doc.get('lastSeen');
      String photoUrl = doc.get('photoUrl');
      String userName = doc.get('username');
      Timestamp time =  doc.get('time');
*/

      String? id = doc.get('id');
      String? postId = doc.get('postId');
      String? userName = doc.get('userName');
      String? ownerId = doc.get('ownerId');
      String? location = doc.get('location');
      String? timestamp = doc.get('timestamp');
      String? mediaUrl = doc.get('mediaUrl');
      String? description = doc.get('description');
      Post curPost =  Post.Complete(id,postId,userName,ownerId,location,timestamp,mediaUrl,description);
      bool exists = Post.posts.any((entity) => entity.postId == curPost.postId);

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
        Post.posts.add(curPost);
      }

    });


    print(Post.posts.length);
/*


    JSONMethods wj = JSONMethods();
    wj.writeToJSON(User.users);

*/

    print("writeDOne");

    return Post.posts;

  }

}