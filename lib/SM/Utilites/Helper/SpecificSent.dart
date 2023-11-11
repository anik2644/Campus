import 'dart:io';

import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';
import '../Constants/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SendToFbase {
  Future<Post> sendPost(Post post) async {
    late Post retPost;
   await postRef.add({
      'postId': post.postId,

      'userName': post.userName,

      'ownerId': post.ownerId,

      'location': post.location,

      'description': post.description,
      'id': post.id,
     'ownerEmail': post.ownerEmail,
     'ownerPhotoUrl': post.ownerPhotoUrl,

      'timestamp': post.timestamp,
      'mediaUrl': post.mediaUrl,

      // 'postId' :
      // 'name': name,
      // 'age': age,
    }).then((DocumentReference document) {
      // Retrieve the generated document ID
      String generatedId = document.id;
      postRef.doc(generatedId).update({'id': generatedId});
      retPost = Post.Complete(
          generatedId,
          post.postId,
          post.userName,
          post.ownerId,
          post.location,
          post.timestamp,
          post.mediaUrl,
          post.description,
          post.ownerEmail,
          post.ownerPhotoUrl);
      // Update the document with the generated ID

      print('Data added to Firestore with ID: $generatedId');
    }).catchError((error) => print('Failed to add data: $error'));

    return retPost;
  }


  Future<void> sendUser(User user) async {


  //  late User retUser;
    usersRef.doc(user.id).set({
      'username': user.userName,
      'email': user.email,
      'time': user.time,//Timestamp.now(),
      'id': user.id,
      'bio': user.bio,
      'country': user.country,
      'photoUrl': user.photoUrl,
      'gender': user.gender,
      'isOnline': user.isOnline,
      'lastSeen': user.lastSeen

    });

   /*     .then((DocumentReference document) {
      // Retrieve the generated document ID
      String generatedId = document.id;
      usersRef.doc(generatedId).update({'id': generatedId});
      retUser = User.Complete(

        user.userName,
        user.email,
        user.country!,
        user.bio!,
        user.gender!,
        user.photoUrl!,
        generatedId,
        user.lastSeen,
        user.isOnline,
        user.time,

);
      // Update the document with the generated ID

      print('Data added to Firestore with ID: $generatedId');
    }).catchError((error) => print('Failed to add data: $error'));

    */

  //  return retUser;
  }
}

class SendToFStorage {
  Future<String> sendImage(String pathh) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    late String imgurl;
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('oky');

    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      //Store the file
      await referenceImageToUpload.putFile(File(pathh));
      //Success: get the download URL
      imgurl = await referenceImageToUpload.getDownloadURL();

      print("Img URL:" + imgurl);

      return imgurl;
    } catch (error) {
      return error.toString();
      //Some error occurred
    }
  }
}
