import '../../JSON_Management/FacadeJson/FacadeJson.dart';
import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';

class GetWant{
  Future<List<User>> getAllUserfromJson()
  async {
    List<User> users = await FacadeJson().findAllUser();

    return users;
  }

  Future<List<Post>> getAllPostfromJson()
  async {
    List<Post> posts = await FacadeJson().findAllPost();
    return posts;
  }
}