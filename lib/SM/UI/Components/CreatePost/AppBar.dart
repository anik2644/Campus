import 'package:dhabiansomachar/SM/Utilites/Constants/firebase.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/PostList.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/SpecificSent.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/UpdateWant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import '../../../ModelClass/Post.dart';
import '../../../Utilites/Helper/GetWant.dart';
class CreatAppBar extends StatefulWidget {
 final user;
 final path;
 final caption;
 final location;
 final void Function(bool) onSendPressed;
 
  CreatAppBar({this.user, this.path, this.caption, this.location, required this.onSendPressed,});

  @override
  State<CreatAppBar> createState() => _CreatAppBarState();
}

class _CreatAppBarState extends State<CreatAppBar> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Ionicons.close_outline),
        onPressed: () {
          // viewModel.resetPost();
          Navigator.pop(context);
        },
      ),
      title: Text('Create Post'.toUpperCase()),
      centerTitle: true,
      actions: [

        IconButton(
          onPressed: () async {
            if (_isLoading) {
              return; // Prevent multiple clicks while loading
            }

            else if(widget.path == " "|| widget.caption == " "||widget.location == " ")
              {
                print("nothing added");
                return ;
              }

            try {
              setState(() {
                _isLoading = true;
              });

              widget.onSendPressed(true);
              QuerySnapshot querySnapshot = await postRef.get();
              int collectionSize = querySnapshot.size + 1;
              String photoUrl = await SendToFStorage().sendImage(widget.path);

              DateTime now = DateTime.now();
              String formattedDateTime = DateFormat('EEEE, MMMM d, \nHH:mm, yyyy' ).format(now);

              print(formattedDateTime);
              print(widget.user.id);

              Post post = Post.Complete(
                "id",
                collectionSize.toString(),
                widget.user.userName,
                widget.user.id,
                widget.location,
                formattedDateTime,
                photoUrl,
                widget.caption,
                widget.user.email,
                widget.user.photoUrl,
              );

              Post createdPost = await SendToFbase().sendPost(post);

              print(createdPost.description);
              await UpdateWant().updateJsonPosts();
              PostList().setPosts(await GetWant().getAllPostfromJson());


              // Call the callback with the flag value (true in this case)


              print("Post Clicked");
            } catch (error) {
              print('Error sending post: $error');
              // Handle the error if needed
            } finally {
              setState(() {

                _isLoading = false;
                Navigator.pop(context);
              });
            }


          },
          icon: _isLoading ? Icon(Icons.ac_unit_outlined) : Icon(Icons.send),
        ),


/*
        IconButton(
            onPressed: () async {

              widget.onSendPressed(true);
              QuerySnapshot querySnapshot = await postRef.get();
              int collectionSize = querySnapshot.size +1;
              String photourl = await SendToFStorage().sendImage(widget.path);


              Post post = Post.Complete("id", collectionSize.toString(), widget.user.userName, widget.user.id, widget.location, Timestamp.now().seconds.toString(), photourl, widget.caption, widget.user.email, widget.user.photoUrl);

              Post ppost = await SendToFbase().sendPost(post);

              print(ppost.description);
              await UpdateWant().updateJsonPosts();
              Navigator.pop(context);

              //rint(loc);
              print("Post Clicked");

            },
            icon: Icon(Icons.send))
*/
        /*
QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionPath).get();
    return querySnapshot.size;

          GestureDetector(
            onTap: () async {

              String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

            //  Reference referenceRoot = FirebaseStorage.instance.ref();
              //   Reference referenceDirImages = referenceRoot.child('images');

              // Reference referenceImageToUpload =
              // referenceDirImages.child(uniqueFileName);

/*

              try {
                //Store the file
                await referenceImageToUpload.putFile(File(pathh));
                //Success: get the download URL
                imgurl = await referenceImageToUpload.getDownloadURL();

                print("Img URL:" +imgurl);
              } catch (error) {
                //Some error occurred
              }
*/
             QuerySnapshot querySnapshot = await postRef.get();
                int collectionLength = querySnapshot.size;
              DateTime now = DateTime.now();
              String formattedDateTime = DateFormat('EEEE, MMMM d, \nHH:mm, yyyy' ).format(now);
              post =Post.Complete("vugichugi", collectionLength,thisUser.userName, thisUser.id, loc, formattedDateTime, imgurl, des, thisUser.email, thisUser.photoUrl);

              /*

               Post posst = SendToFbase().sendPost(post);
               PostList().addPost(posst);


               */
              print(">>");
              Navigator.pop(context);
              //_currentTime;
              //  await viewModel.uploadPosts(context);
              // viewModel.resetPost();
            },
            child: Text(
              'Post'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )


           */

      ],
    );
  }
}
