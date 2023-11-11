import 'package:dhabiansomachar/SM/Utilites/Helper/SentWant.dart';

class UpdateWant{
  updateJsonUsers() {
     SentWant().sentAllUsertoJson();
  }
  updateJsonPosts() {
    SentWant().sentAllPosttoJson();
  }
}