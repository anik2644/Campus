import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/ModelClass/Content.dart';
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
    else if(collectionName == "contents")
    {
      List<Content> rt= await fetchContent();
      return rt as List<Content>;
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
       // print("already in the list");
      }
      else
      {
       // print("not exist in the list");
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
        //print("already in the list");
      }
      else
      {
        //  print("not exist in the list");
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

  Future<List<Content>> fetchContent() async {

    List<String> AllImagesList=[];
    List<String> ContentImageSequence =[];
    List<String> ContentSegments =[];
    late String Location;
    late String Title;

    print("Content Fetching");
    CollectionReference collection = FirebaseFirestore.instance.collection('Contents');
    QuerySnapshot querySnapshot = await collection.get();

    print(querySnapshot.docs.length);

    querySnapshot.docs.forEach((doc) {


      AllImagesList = List<String>.from(doc.get('AllImagesList'));
      ContentSegments= List<String>.from(doc.get('ContentSegments'));
      ContentImageSequence= List<String>.from(doc.get('ContentImageSequence'));
      Location = doc.get('Location');
      Title = doc.get('Title');

      Content content =Content(AllImagesList,ContentImageSequence,ContentSegments,Location,Title);
      Content.Contents.add(content);
      //print(content.Title);

/*      setState(() {
        isLoading = false;
      });*/
    });
    print("data fetch done");

    print(Content.Contents.length);
/*


    JSONMethods wj = JSONMethods();
    wj.writeToJSON(User.users);

*/

    print("writeDOne");

    return Content.Contents;

  }



/*

  Future<void> fetchData() async {

    Content.ContentList.clear();
    AllImagesList.clear();
    ContentSegments.clear();
    ContentImageSequence.clear();


    CollectionReference collection = FirebaseFirestore.instance.collection('Contents');
    QuerySnapshot querySnapshot = await collection.get();

    print(querySnapshot.docs.length);

    querySnapshot.docs.forEach((doc) {


      AllImagesList = List<String>.from(doc.get('AllImagesList'));
      ContentSegments= List<String>.from(doc.get('ContentSegments'));
      ContentImageSequence= List<String>.from(doc.get('ContentImageSequence'));
      Location = doc.get('Location');
      Title = doc.get('Title');

      Content content =Content(AllImagesList: AllImagesList, ContentImageSequence: ContentImageSequence, ContentSegments: ContentSegments, Location: Location, Title: Title);
      Content.Contents.add(content);
      print(content.Title);

      setState(() {
        isLoading = false;
      });
    });
    print("data fetch done");
  }


*/




}