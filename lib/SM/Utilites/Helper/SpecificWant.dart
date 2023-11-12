import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/UserList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpecificWant{
  
  User specificUserFromJson(String id)
  {
    List<User> users= UserList().getUsers();
    //users.forEach((element) {print(element.id);});
    return users.firstWhere((element) => element.id == id);
  }

  User specificUserFromRam(String id)
  {
    List<User> users= UserList().getUsers();
    //users.forEach((element) {print(element.id);});
    return users.firstWhere((element) => element.id == id);
  }


  Future<User> getUserByIdfromFb(String userId) async {
    try {
      CollectionReference<Map<String, dynamic>> usersRef = FirebaseFirestore
          .instance.collection('users');
      DocumentSnapshot<Map<String, dynamic>> snapshot = await usersRef.doc(
          userId).get();
      if (snapshot.exists) {
        return User.fromFirestore(snapshot);
      } else {
        throw Exception("User not found in Firestore");
      }
    } catch (e) {
      // Handle any errors
      print("Error fetching user: $e");
      rethrow;
    }
  }
}

