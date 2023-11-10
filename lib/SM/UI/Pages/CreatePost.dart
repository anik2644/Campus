import 'dart:io';

import 'package:dhabiansomachar/SM/ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/AppBar.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/DescriptionBox.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/LocationBox.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/ProfileInfo.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/SendToFbase.dart';

import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/PostList.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_overlay/loading_overlay.dart';
//import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';
import '../../Utilites/Constants/firebase.dart';
import '../Widgets/indicators.dart';
import '../Components/CreatePost/posts_view_model.dart';



class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

 // PostModel pp =  PostModel("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg");

  late String imgurl;
  late String des;
  User thisUser =LoginCredentials().loggedInUser!;
  late Post post;
  late String loc;
  File? mediaUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  key: viewModel.scaffoldKey,
      appBar:PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight),child: CreatAppBar()),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        children: [
          
          ProfileInfo(),
          flag ==0? InkWell(
            onTap: () {
              print("Choose image") ;
              showImageChoices(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              child: //viewModel.imgLink != null
              // filee != null?
              // Image.file(
              //   filee!.path as File ,
              //   fit: BoxFit.contain,
              // ):

              flag==1
                  ?
              Image.network(imgurl)
              // CustomImage(
              //         imageUrl: viewModel.imgLink,
              //         width: MediaQuery.of(context).size.width,
              //         height: MediaQuery.of(context).size.width - 30,
              //         fit: BoxFit.cover,
              //       )
                  : mediaUrl == null
                  ? Center(
                child: Text(
                  'Upload a Photo',
                  style: TextStyle(
                    color:
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )
                  : Image.file(
                  mediaUrl!,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 30,
                fit: BoxFit.cover,
              ),
            ),
          ) : InkWell(
            onTap: () {
              print("Choose image") ;
              showImageChoices(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              child:Image.file(
                File(pathh),
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
         DescriptionBox( onDescriptionChanged: (description) {setState(() => des = description);},),
         LocationBox( onLocationChanged: (location) {setState(() => loc = location);},),


    ],
      ),
    );
  }

  showImageChoices(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Select Image',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Ionicons.camera_outline),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                 // viewModel.pickImage(camera: true);
                },
              ),
              ListTile(
                leading: Icon(Ionicons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickImagee();

                  // viewModel.pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  XFile? filee ;
  String pathh="";
  int flag =0;

  Future<void> pickImagee() async {

    ImagePicker imagePicker = ImagePicker();
    filee =
    await imagePicker.pickImage(source: ImageSource.gallery);
    print('${filee?.path}');

    if (filee == null) return;

    setState(() {
      pathh =filee!.path;
      flag =1;
    });
  }
}
