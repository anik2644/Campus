import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/ModelClass/Content.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';


class FBContentsOffice{
  Future<List<Content>> fetchContent() async {

    List<Content> Contents = [];

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
      Contents.add(content);
      //print(content.Title);

/*      setState(() {
        isLoading = false;
      });*/
    });
    print("data fetch done");

    print(Contents.length);
/*


    JSONMethods wj = JSONMethods();
    wj.writeToJSON(User.users);

*/

    print("writeDOne");

    return Contents;

  }
}