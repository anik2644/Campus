import 'dart:io';

import '../../ModelClass/Post.dart';
import '../Constants/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SendToFbase {
  Post sendPost(Post post) {
    late Post retPost;
    postRef.add({
      'postId': post.postId,

      'userName': post.userName,

      'ownerId': post.ownerId,

      'location': post.location,

      'description': post.description,
      'id': post.id,

      'timestamp': post.timestamp,
      'mediaUrl': post.mediaUrl,

      // 'postId' :
      // 'name': name,
      // 'age': age,
    }).then((DocumentReference document) {
      // Retrieve the generated document ID
      String generatedId = document.id;
      postRef.doc(generatedId).update({'documentId': generatedId});
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
