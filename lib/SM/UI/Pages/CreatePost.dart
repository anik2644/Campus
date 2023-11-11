import 'dart:io';

import 'package:dhabiansomachar/SM/ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/AppBar.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/DescriptionBox.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/LocationBox.dart';
import 'package:dhabiansomachar/SM/UI/Components/CreatePost/ProfileInfo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:image_picker/image_picker.dart';

import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';
import '../Components/Common/ImagePickOption.dart';


class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

 // PostModel pp =  PostModel("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg");

  late String imgurl;
   String path = " ";
  late String des= " ";
  User thisUser =LoginCredentials().loggedInUser!;
  late Post post;
  late String loc= " ";
  File? mediaUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  key: viewModel.scaffoldKey,
      appBar:PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight),child: CreatAppBar(user: thisUser,path: path,caption: des,location: loc,onSendPressed: (bool flag) {
        // Handle the flag value here
        if (flag) {
          print("truuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuueeeeee");
        } else {
          // Do something when the "Send" button is not pressed
        }
      },)),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        children: [
          
          ProfileInfo(),


        ImagePickBox(
          onImageSelected: (String imagePath) {

            setState(() => path = imagePath);
            // Handle the selected image path here
            print('Received Image Path: $imagePath');
            // You can pass this path to your ViewModel or perform any other actions
          },
        ),
          /*

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

         */
         DescriptionBox( onDescriptionChanged: (description) {setState(() => des = description);},),
         LocationBox( onLocationChanged: (location) {setState(() => loc = location);},),


    ],
      ),
    );
  }
/*

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


  */

}
