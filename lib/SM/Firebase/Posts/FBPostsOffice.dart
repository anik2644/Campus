import '../../ModelClass/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FBPostsOffice{

  Future<List<Post>> fetchPost() async {

    print("Post Fetching");
    CollectionReference collection = FirebaseFirestore.instance.collection('all_Posts');
    QuerySnapshot querySnapshot = await collection.get();


    querySnapshot.docs.forEach((doc) {


      String? id = doc.get('id');
      String? postId = doc.get('postId');
      String? userName = doc.get('userName');
      String? ownerId = doc.get('ownerId');
      String? location = doc.get('location');
      String? timestamp = doc.get('timestamp');
      String? mediaUrl = doc.get('mediaUrl');
      String? description = doc.get('description');
      String? ownerEmail = doc.get('ownerEmail');
      String? ownerPhotoUrl = doc.get('ownerPhotoUrl');

      Post curPost =  Post.Complete(id,postId,userName,ownerId,location,timestamp,mediaUrl,description,ownerEmail,ownerPhotoUrl);
      bool exists = Post.posts.any((entity) => entity.postId == curPost.postId);

      // print(curUser.userName);
      // //print(DateFormat("MMMM d, y 'at' h:mm:ss a 'UTC'z").format(curUser.lastSeen.toDate()).toString());
      // print(curUser.time.toDate());
      if(exists)
      {
        //print("already in the list");
      }
      else
      {
        //  print("not exist in the list");
        Post.posts.add(curPost);
      }

    });


    print(Post.posts.length);
/*


    JSONMethods wj = JSONMethods();
    wj.writeToJSON(User.users);

*/

    print("writeDOne");

    return Post.posts;

  }

}