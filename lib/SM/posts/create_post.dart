import 'dart:io';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/SM/models/post.dart';
// import 'package:social_media_app/components/custom_image.dart';
// import 'package:social_media_app/models/user.dart';
// import 'package:social_media_app/utils/firebase.dart';
// import 'package:social_media_app/view_models/auth/posts_view_model.dart';
// import 'package:social_media_app/widgets/indicators.dart';

import '../components/custom_image.dart';
import '../models/user.dart';
import '../pages/feeds.dart';
import '../utils/firebase.dart';
import '../view_models/auth/posts_view_model.dart';
import '../widgets/indicators.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  PostModel pp =  PostModel("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg");

  String imgurl= " ";
  int flag =0;
  @override
  Widget build(BuildContext context) {
    currentUserId() {
      return firebaseAuth.currentUser!.uid;
    }

    PostsViewModel viewModel = Provider.of<PostsViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        await viewModel.resetPost();
        return true;
      },
      child: LoadingOverlay(
        progressIndicator: circularProgress(context),
        isLoading: viewModel.loading,
        child: Scaffold(
          key: viewModel.scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Ionicons.close_outline),
              onPressed: () {
                viewModel.resetPost();
                Navigator.pop(context);
              },
            ),
            title: Text('Create Post'.toUpperCase()),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () async {

                  pp.ownerId= firebaseAuth.currentUser!.email;

                  int ind = UserModel.getUserIndex(pp.ownerId ?? "");
                  pp.username = UserModel.um[ind].username;
                  pp.postId= (p.Pl.length +1).toString();

                  DateTime now = DateTime.now();
                  String formattedDateTime = DateFormat('EEEE, MMMM d, \nHH:mm, yyyy' ).format(now);
                  pp.timestamp= formattedDateTime;
                  p.Pl.add(pp);

                  print(pp.postId);
                  print(pp.username);
                  print(pp.ownerId);
                  print(pp.location);
                  print(pp.description);
                  print(pp.id);
                  print(pp.timestamp);
                  print(pp.mediaUrl);





                    // Replace 'your_collection' with the actual name of your Firestore collection
                    CollectionReference collection = FirebaseFirestore.instance.collection('all_Posts');

                    collection
                        .add({

                    'postId' : pp.postId,


                    'userName': pp.username,


                    'ownerId' :pp.ownerId,


                    'location' :pp.location,


                    'description' :pp.description,
                    'id' :pp.id,


                    'timestamp' :pp.timestamp,
                    'mediaUrl' :pp.mediaUrl,



                    // 'postId' :
                      // 'name': name,
                      // 'age': age,
                    })
                        .then((value) => print('Data added to Firestore'))
                        .catchError((error) => print('Failed to add data: $error'));



                  print(">>");
                  Navigator.pop(context);
                  //_currentTime;
                //  await viewModel.uploadPosts(context);
                 // viewModel.resetPost();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Post'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              )
            ],
          ),

          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            children: [
              SizedBox(height: 15.0),
              StreamBuilder(
                stream: usersRef.doc(currentUserId()).snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    UserModel user = UserModel.fromJson(
                      snapshot.data!.data() as Map<String, dynamic>,
                    );
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(user.photoUrl!),
                      ),
                      title: Text(
                        user.username!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        user.email!,
                      ),
                    );
                  }
                  return Container();
                },
              ),
              InkWell(
                onTap: () {
                  print("Choose image") ;
                  showImageChoices(context, viewModel);
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
                      : viewModel.mediaUrl == null
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
                              viewModel.mediaUrl!,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width - 30,
                              fit: BoxFit.cover,
                            ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Post Caption'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                initialValue: viewModel.description,
                decoration: InputDecoration(
                  hintText: 'Eg. This is very beautiful place!',
                  focusedBorder: UnderlineInputBorder(),
                ),
                maxLines: null,
                onChanged: (val) {
                  pp.description =val;
                  viewModel.setDescription(val);
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Location'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0.0),
                title: Container(
                  width: 250.0,
                  child: TextFormField(
                    controller: viewModel.locationTEC,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      hintText: 'United States,Los Angeles!',
                      focusedBorder: UnderlineInputBorder(),
                    ),
                    maxLines: null,
                    onChanged: (val) {
                      pp.location =val;
                      viewModel.setLocation(val);
                    },
                  ),
                ),
                trailing: IconButton(
                  tooltip: "Use your current location",
                  icon: Icon(
                    CupertinoIcons.map_pin_ellipse,
                    size: 25.0,
                  ),
                  iconSize: 30.0,
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () => viewModel.getLocation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showImageChoices(BuildContext context, PostsViewModel viewModel) {
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
                  viewModel.pickImage(camera: true);
                },
              ),
              ListTile(
                leading: Icon(Ionicons.image),
                title: Text('Gallery'),
                onTap: () {
                //  Navigator.pop(context);

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
  Future<void> pickImagee() async {

    ImagePicker imagePicker = ImagePicker();
     filee =
        await imagePicker.pickImage(source: ImageSource.gallery);
    print('${filee?.path}');

    if (filee == null) return;
    //Import dart:core
    String uniqueFileName =
    DateTime.now().millisecondsSinceEpoch.toString();

    /*Step 2: Upload to Firebase storage*/
    //Install firebase_storage
    //Import the library

    //Get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
    referenceRoot.child('images');

    //Create a reference for the image to be stored
    Reference referenceImageToUpload =
    referenceDirImages.child(uniqueFileName);

    //Handle errors/success
    try {
      //Store the file
      await referenceImageToUpload.putFile(File(filee!.path));
      //Success: get the download URL
      imgurl = await referenceImageToUpload.getDownloadURL();

      print("Img URL:" +imgurl);
    } catch (error) {
      //Some error occurred
    }

    setState(() {
      pp.mediaUrl = imgurl;
     flag =1;
    });
  }
}
