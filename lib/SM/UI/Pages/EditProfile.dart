import 'package:dhabiansomachar/SM/JSON_Management/Auth/Credential.dart';
import 'package:dhabiansomachar/SM/ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:dhabiansomachar/SM/UI/Components/Common/ImagePickBox.dart';
import 'package:dhabiansomachar/SM/UI/Components/EditProfile/AppBAr.dart';
import 'package:dhabiansomachar/SM/UI/Pages/TakeImage.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/SpecificSent.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/SpecificUpdate.dart';
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

import '../../Utilites/Auth/Validation.dart';
import '../../Utilites/Constants/firebase.dart';
import '../../Utilites/Helper/GetWant.dart';
import '../../Utilites/Helper/Singleton/UserList.dart';
import '../../Utilites/Helper/UpdateWant.dart';
import '../Components/Register/text_form_builder.dart';
import '../Helper/edit_profile_view_model.dart';
import '../widgets/indicators.dart';
// import 'package:social_media_app/components/text_form_builder.dart';
// import 'package:social_media_app/models/user.dart';
// import 'package:social_media_app/utils/firebase.dart';
// import 'package:social_media_app/utils/validation.dart';
// import 'package:social_media_app/view_models/profile/edit_profile_view_model.dart';
// import 'package:social_media_app/widgets/indicators.dart';

class EditProfile extends StatefulWidget {
  final User? user;

  const EditProfile({this.user});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user;


 // int ind = UserModel.getUserIndex(firebaseAuth.currentUser!.email ?? "");
  String imgurl= "a"; //widget.user.photoUrl  ?? "";
  String? country ="a";// UserModel.um[ind].photoUrl;
  //user.photoUrl!.isEmpty;
  String Username = "a";
  String bio = "a";
  String path= "null";
  bool isUpdating = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController   bioController = TextEditingController();
  TextEditingController countryController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState

    usernameController.text= widget.user!.userName;
    bioController.text= widget.user!.bio!;
    countryController.text= widget.user!.country!;
    super.initState();
  }

  String currentUid() {
    return firebaseAuth.currentUser!.uid;
  }

//  int ind = UserModel.getUserIndex(firebaseAuth.currentUser!.email ?? "");

  @override
  Widget build(BuildContext context) {
   // EditProfileViewModel viewModel = Provider.of<EditProfileViewModel>(context);
    return LoadingOverlay(
      progressIndicator: circularProgress(context),
      isLoading: false,//viewModel.loading,
      child: Scaffold(
        //key: viewModel.scaffoldKey,
        appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: EditProfileAppBar()),

        body:isUpdating? Center(child: CircularProgressIndicator(backgroundColor: Colors.black,)) :
        ListView(
          children: [
            Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      //pickImagee();
                      //viewModel.pickImage();

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => TakeImage(
                            onImageSelected: (String imagePath) {

                              setState(() {
                                path = imagePath;
                              });

                              print('getting the path: $imagePath');
                            },
                            isProfilePhoto: false, // Provide the flag value here
                          ),
                        ));

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
                      path != "null"?
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 65.0,
                          backgroundImage: FileImage(File(path)), //NetworkImage(viewModel.imgLink!),
                        ),
                      )
                          :

                      widget.user!.photoUrl ==null
                          ? Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 65.0,
                          //backgroundImage: CachedNetworkImageProvider( widget.user!.photoUrl ?? ""), //NetworkImage(viewModel.imgLink!),
                        ),
                      ) :
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 65.0,
                          backgroundImage: CachedNetworkImageProvider(widget.user!.photoUrl!),
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                IconButton(onPressed: (){
                  path = "null";
                  usernameController.text = widget.user!.userName;
                  bioController.text = widget.user!.bio!;
                  countryController.text = widget.user!.country!;
                  setState(() {});
                }, icon: Icon(Icons.refresh))
              ],
            ),
            SizedBox(height: 30.0),
            buildForm( context),
            SizedBox(height: 30.0),
            Center(
              child: Container(
                width: 120.0,
                child: TextButton(
                  onPressed: () async {


                    isUpdating =true;
                    setState(() {});
                    bool isPhotoChanged = false;
                    bool isBioChanged = false;
                    bool isUsernameChanged = false;
                    bool isCountryChanged = false;


                    if(path!="null")
                      {
                        imgurl = await SendToFStorage().sendImage(path);

                        widget.user!.photoUrl = imgurl;
                        isPhotoChanged =true;
                      }
                    if(usernameController.text != widget.user!.userName)
                      {
                        widget.user!.userName = usernameController.text;
                        isUsernameChanged = true;
                      }

                    if (bioController.text != widget.user!.bio) {
                      widget.user?.bio =bioController.text;
                      isBioChanged = true;
                    }

                    if (countryController.text != widget.user!.country) {
                      widget.user?.country =countryController.text;
                      isCountryChanged = true;
                    }

/*                    print(path);
                    print(usernameController.text);
                    print(bioController.text);
                    print(countryController.text);*/

                    print(path);
                    print(widget.user!.id);
                    print(widget.user!.country);
                    print(widget.user!.userName);
                    print(widget.user!.bio);


                    await SpecificUpdate().updateUser(widget.user!, isUsernameChanged, isBioChanged, isCountryChanged, isPhotoChanged);

                    await UpdateWant().updateJsonUsers();
                    List <User> us = await GetWant().getAllUserfromJson();
                    UserList().setUsers( us);

                    Credential().saveCredential(widget.user!);
                    LoginCredentials().login(widget.user!);

                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0, // Adjust the font size as needed
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    // You can add more styles as needed
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


/*
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

    */
/*Step 2: Upload to Firebase storage*//*

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
*/

  buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        //key: viewModel.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                TextFormBuilder(
                //  enabled: !viewModel.loading,
                 // initialValue: widget.user!.userName,
                  controller: usernameController,
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
/*                IconButton(onPressed: (){
                  usernameController.text = widget.user!.userName;
                  setState(() {});
                }, icon: Icon(Icons.refresh))*/
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              children: [
                TextFormBuilder(
                //  initialValue: widget.user!.country,
                  controller: countryController,
                 // enabled: !viewModel.loading,
                  prefix: Ionicons.pin_outline,
                  hintText: "Country",
                  textInputAction: TextInputAction.next,
                  validateFunction: Validations.validateName,
                  onSaved: (String val) {
                    country =val;
                   // viewModel.setCountry(val);
                  },
                ),

                SizedBox(height: 10.0),
/*                IconButton(onPressed: (){
                  countryController.text = widget.user!.country!;
                  setState(() {});
                }, icon: Icon(Icons.refresh))*/
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              "Bio",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                TextFormField(
                  maxLines: null,
                 // initialValue: widget.user!.bio,
                  controller: bioController,
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
                   // viewModel.setBio(val);
                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                    isDense: true,
                  ),

                ),
                SizedBox(height: 10.0),
/*                IconButton(onPressed: (){
                  bioController.text = widget.user!.bio!;
                  setState(() {});
                }, icon: Icon(Icons.refresh))*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
