import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../components/text_form_builder.dart';
import '../models/user.dart';
import '../utils/firebase.dart';
import '../utils/validation.dart';
import '../view_models/profile/edit_profile_view_model.dart';
import '../widgets/indicators.dart';
// import 'package:social_media_app/components/text_form_builder.dart';
// import 'package:social_media_app/models/user.dart';
// import 'package:social_media_app/utils/firebase.dart';
// import 'package:social_media_app/utils/validation.dart';
// import 'package:social_media_app/view_models/profile/edit_profile_view_model.dart';
// import 'package:social_media_app/widgets/indicators.dart';

class EditProfile extends StatefulWidget {
  final UserModel? user;

  const EditProfile({this.user});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModel? user;


  int ind = UserModel.getUserIndex(firebaseAuth.currentUser!.email ?? "");
  String imgurl= "a"; //widget.user.photoUrl  ?? "";
  String? country ="a";// UserModel.um[ind].photoUrl;
  //user.photoUrl!.isEmpty;
  String Username = "a";
  String bio = "a";

  String currentUid() {
    return firebaseAuth.currentUser!.uid;
  }

//  int ind = UserModel.getUserIndex(firebaseAuth.currentUser!.email ?? "");

  @override
  Widget build(BuildContext context) {
    EditProfileViewModel viewModel = Provider.of<EditProfileViewModel>(context);
    return LoadingOverlay(
      progressIndicator: circularProgress(context),
      isLoading: viewModel.loading,
      child: Scaffold(
        key: viewModel.scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Edit Profile"),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () async {



                    print(country);
                    print(imgurl);
                    print(bio);
                    print(firebaseAuth.currentUser!.uid);
                    print(firebaseAuth.currentUser!.photoURL);



                    if(bio == "a")
                    {
                      bio =widget.user?.bio ?? "";
                    }
                    if(imgurl == "a")
                    {
                      imgurl =widget.user?.photoUrl ?? "";
                    }
                    if(country == "a")
                    {
                      country =widget.user?.country ?? "";
                    }
                    if(Username == "a")
                    {
                      Username =widget.user?.username ?? "";
                    }
                    //CollectionReference collection = FirebaseFirestore.instance.collection('users');

                    CollectionReference collection =
                    FirebaseFirestore.instance.collection('users');
                    DocumentReference document = collection.doc(firebaseAuth.currentUser!.uid);

                    try {
                      await document.update({

                        // 'field_name': 'new_value',
                        'bio': bio,
                        'country' : country,
                        'username' : Username,
                        'photoUrl' : imgurl,


                      });
                      print('Field updated successfully.');
                    } catch (e) {
                      print('Error updating field: $e');
                    }

                    Navigator.of(context).pop();
                    // viewModel.editProfile(context);
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  pickImagee();
                  //viewModel.pickImage();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: new Offset(0.0, 0.0),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child:
                  imgurl != "a"?
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundImage: CachedNetworkImageProvider( imgurl ?? ""), //NetworkImage(viewModel.imgLink!),
                    ),
                  )
                      :


                  // file != null?
                  // Image.file(
                  //    file!.path as File,
                  //   fit: BoxFit.contain,
                  // ):
                  //

                  widget.user!.photoUrl !=null //UserModel.um[ind].photoUrl != null
                  //viewModel.imgLink != null
                      ? Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundImage: CachedNetworkImageProvider( widget.user!.photoUrl ?? ""), //NetworkImage(viewModel.imgLink!),
                    ),
                  )
                      : viewModel.image == null
                      ? Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundImage:
                      NetworkImage(widget.user!.photoUrl!),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundImage: NetworkImage(imgurl),
                      //FileImage(viewModel.image!),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            buildForm(viewModel, context)
          ],
        ),
      ),
    );
  }
  XFile? file;

  Future<void> pickImagee() async {

    ImagePicker imagePicker = ImagePicker();
    file =
    await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');

    if (file == null) return;
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
      await referenceImageToUpload.putFile(File(file!.path));
      //Success: get the download URL

      //String imgurl= " ";
      imgurl = await referenceImageToUpload.getDownloadURL();

      print("Img URL:" +imgurl);
      setState(() {

      });
    } catch (error) {
      //Some error occurred
    }

  }

  buildForm(EditProfileViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: viewModel.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormBuilder(
              enabled: !viewModel.loading,
              initialValue: widget.user!.username,
              prefix: Ionicons.person_outline,
              hintText: "Username",
              textInputAction: TextInputAction.next,
              validateFunction: Validations.validateName,
              onSaved: (String val) {
                Username = val;
                // viewModel.setUsername(val);
              },
            ),
            SizedBox(height: 10.0),
            TextFormBuilder(
              initialValue: widget.user!.country,
              enabled: !viewModel.loading,
              prefix: Ionicons.pin_outline,
              hintText: "Country",
              textInputAction: TextInputAction.next,
              validateFunction: Validations.validateName,
              onSaved: (String val) {
                country =val;
                viewModel.setCountry(val);
              },
            ),
            SizedBox(height: 10.0),
            Text(
              "Bio",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              maxLines: null,
              initialValue: widget.user!.bio,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value!.length > 1000) {
                  return 'Bio must be short';
                }
                return null;
              },
              onSaved: (String? val) {
                bio= val!;
                //viewModel.setBio(val!);
              },
              onChanged: (String val) {
                bio= val;
                viewModel.setBio(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
