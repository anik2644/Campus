import 'package:dhabiansomachar/SM/JSON_Management/model/PostJsonModel.dart';
import 'package:dhabiansomachar/SM/JSON_Management/model/UserJsonModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../../../ModelClass/Post.dart';
import '../../../ModelClass/User.dart';

class RawConversionModel{

  User UserJsonToUser(UserJsonModel element)
  {
    User user = User.Complete(element.userName, element.email, element.country!, element.bio!, element.gender!, element.photoUrl!, element.id!,DataConversion().stringToTimestamp(element.lastSeen!) ,DataConversion().stringToBool(element.isOnline!) , DataConversion().stringToTimestamp(element.time!));
    return user;
  }

  Post PostonToPost(PostJsonModel element){

  Post post = Post.Complete(element.id, element.postId, element.userName!, element.ownerId!, element.location!, element.timestamp!, element.mediaUrl!,element.description,element.ownerEmail,element.ownerEmail);
  return post;
}
}

class DataConversion{

  Timestamp stringToTimestamp(String? inputString)
  {
    int seconds = int.parse(inputString!.split('seconds=')[1].split(', ')[0]);
    int nanoseconds = int.parse(inputString!.split('nanoseconds=')[1].split(')')[0]);
    Timestamp output = Timestamp(seconds, nanoseconds);
    return output;
  }
  bool stringToBool(String? inputString)
  {
    return inputString!.toLowerCase() == 'true';
  }


}