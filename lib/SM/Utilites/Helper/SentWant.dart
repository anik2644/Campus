import '../../Firebase/FIREBASE.dart';
import '../../JSON_Management/JSONFile.dart';
import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';

class SentWant {
  void sentAllUsertoJson()
  async {
    FIREBASE userFirebase = FIREBASE("users");
    List<Object> userObjects = await userFirebase.fetchData();
    List<User> users = userObjects as List<User>;//userObjects.map((userObject) => User.fromJson(userObject)).toList();

    users.forEach((user) {
      print("User ID: ${user.id}, Name: ${user.userName}");
    });

    print("Read users done\n\n");

    JSONFile userJSONFile = JSONFile("users");
    userJSONFile.write(users);
  }

  void sentAllPosttoJson() async {


    FIREBASE fb = FIREBASE("posts");
    List<Object> uk = await fb.fetchData();
    List<Post> posts = uk as List<Post>;
    posts.forEach((element) {print(element.description);});

    print("read done\n\n");

    JSONFile jfl = JSONFile("posts");
    jfl.write(posts);
  }

}