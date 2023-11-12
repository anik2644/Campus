import '../../ModelClass/User.dart';
import '../Constants/firebase.dart';

class SpecificUpdate{
  Future<void> updateUser(User user, bool isUsernameChanged, bool isBioChanged, bool isCountryChanged, bool isPhotoChanged) async {
    Map<String, dynamic> updateData = {};

    if (isUsernameChanged) {
      updateData['username'] = user.userName;
    }

    if (isBioChanged) {
      updateData['bio'] = user.bio;
    }

    if (isCountryChanged) {
      updateData['country'] = user.country;
    }

    if (isPhotoChanged) {
      updateData['photoUrl'] = user.photoUrl;
    }

    if (updateData.isNotEmpty) {
      await usersRef.doc(user.id).update(updateData);
      print('User updated in Firestore');
    } else {
      print('No changes to update');
    }
  }

}