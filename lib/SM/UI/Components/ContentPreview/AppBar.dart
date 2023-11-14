import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ContentAppBAr extends StatefulWidget {
  //const ContentAppBAr({super.key});
  final List<String> InputImagesSequence; // = [];
  final List<String> ContentImageSequence; // = [];
  final List<String> ContentSegments;

  final String location;
  final String title;
  final Function(bool) onLoading;

  const ContentAppBAr(
      { required this.onLoading,
        required this.InputImagesSequence,
        required this.ContentImageSequence,
        required this.ContentSegments,
        required this.location,
        required this.title}); //
  @override
  State<ContentAppBAr> createState() => _ContentAppBArState();
}

class _ContentAppBArState extends State<ContentAppBAr> {

  List<String> AllImagesList = [];
  String imgurl = "";
  bool isloading = false;
  Future<void> AddThisContentToFireStore() async {
    CollectionReference collection =
    FirebaseFirestore.instance.collection('Contents');

    try {
      await collection.doc(widget.title).set({
        'Title': widget.title,
        'AllImagesList': AllImagesList,
        'ContentImageSequence': widget.ContentImageSequence,
        'ContentSegments': widget.ContentSegments,
        'Location': widget.location,
      });
      print(
          'String array added to Firestore collection with document ID successfully.');
    } catch (e) {
      print('Error adding string array to Firestore collection: $e');
    }
  }

  Future<void> SentAllImageTOFireStorage() async {


    AllImagesList.clear();
    print("loop start");
    for (int i = 0; i < widget.InputImagesSequence.length; i++) {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      String path =widget.InputImagesSequence[i];
      String temp = widget.title;
      String imgName = '$temp$i$uniqueFileName';

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('contents');
      Reference referenceImageToUpload = referenceDirImages.child(imgName);

      try {
        //Store the file
        await referenceImageToUpload.putFile(File(path));
        //Success: get the download URL
        imgurl = await referenceImageToUpload.getDownloadURL();

        print("Img URL:" + imgurl);
        AllImagesList.add(imgurl);
      } catch (error) {

        print(error);
      }
    }

    print("loop done");

    AllImagesList.forEach((element) {  print(element);});
    //print(AllImagesList.toString());
    await AddThisContentToFireStore();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue, // Set your desired background color
      elevation: 0, // Remove the elevation for a flat design
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), // Back button icon
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
       isloading?
           Padding(
             padding: const EdgeInsets.only(right:18.0),
             child: Icon(Icons.refresh_rounded),
           )
           :TextButton(
          onPressed: () async {

            isloading =true;
            setState(() {

            });
            // Your functionality here
            widget.onLoading(isloading);

           // await Future.delayed(Duration(seconds: 7));
            await SentAllImageTOFireStorage();
            Navigator.pop(context);
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Card(
            elevation: 8.0, // Adjust the elevation as needed
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Post',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 17),
                  ),
                  SizedBox(width: 8.0), // Add some spacing between icon and text
                  Icon(
                    Icons.send, // Replace with your desired icon
                    color: Colors.blueAccent, // Set the icon color
                  ),
                ],
              ),
            ),
          ),

        ),

      ],
      title: Text(
        'Content Preview',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
