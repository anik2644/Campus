
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../ModelClass/User.dart';
import '../../Utilites/Constants/firebase.dart';

class FetchCredential{


  Future<User> findCredential() async {

    User curUser;
    var collectionReference = FirebaseFirestore.instance.collection('users');
    var query = collectionReference.where('id', isEqualTo: 'ZtVQQ27nhegEynlUCxOlWPdgD713'//firebaseAuth.currentUser!.uid
         );
    var querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      // Access the first document (you may need to loop through if you expect multiple matches)
      var doc = querySnapshot.docs[0].data();

      String bio = doc['bio'];
      String country = doc['country'];
      String email = doc['email'];
      String gender = doc['gender'];
      String id = doc['id'];
      bool isOnline = doc['isOnline'];
      Timestamp lastSeen = doc['lastSeen'];
      String photoUrl = doc['photoUrl'];
      String userName = doc['username'];
      Timestamp time =  doc['time'];


      curUser = new  User.Complete(userName,email,country,bio,gender,photoUrl,id,lastSeen,isOnline,time);
      return curUser as User;

      print(curUser.email);
    } else {
      print('No matching documents found.');
    }

   return null as User;
  }



}