import 'package:dhabiansomachar/SM/Utilites/Helper/SentWant.dart';

class UpdateWant{
  updateJsonUsers() async {
     await SentWant().sentAllUsertoJson();
  }
  updateJsonPosts() async {
    await SentWant().sentAllPosttoJson();
  }
}