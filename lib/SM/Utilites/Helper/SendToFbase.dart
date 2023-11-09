import '../../ModelClass/Post.dart';
import '../Constants/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SendToFbase{

  Post sendPost(Post post)
  {
    late Post retPost;
    postRef.add({

      'postId' : post.postId,


      'userName': post.userName,


      'ownerId' :post.ownerId,


      'location' :post.location,


      'description' :post.description,
      'id' :post.id,


      'timestamp' :post.timestamp,
      'mediaUrl' :post.mediaUrl,



      // 'postId' :
      // 'name': name,
      // 'age': age,
    }).then((DocumentReference document) {

      // Retrieve the generated document ID
      String generatedId = document.id;
      postRef.doc(generatedId).update({'documentId': generatedId});
      retPost = Post.Complete( generatedId, post.postId, post.userName, post.ownerId, post.location, post.timestamp, post.mediaUrl, post.description, post.ownerEmail, post.ownerPhotoUrl);
      // Update the document with the generated ID
     

      print('Data added to Firestore with ID: $generatedId');
      
      
    }).catchError((error) => print('Failed to add data: $error'));


    return retPost;
  }

}