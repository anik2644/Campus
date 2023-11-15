import 'package:dhabiansomachar/SM/ModelClass/LoginFlag.dart';
import 'package:dhabiansomachar/SM/JSON_Management/Auth/Credential.dart';
import '../../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../GetWant.dart';
import '../Singleton/PostList.dart';
import '../Singleton/UserList.dart';

class TakeDataToRam {
  takePostsToRam() async {
    PostList().setPosts(await GetWant().getAllPostfromJson());
    print("posts hasbeen taken to ram");
  }

  takeUSersToRam() async {
    UserList().setUsers(await GetWant().getAllUserfromJson());
    print("user hasbeen taken to ram");
  }

  takePostsAndUsersToRam() async {
    await takeUSersToRam();
    await takePostsToRam();
  }

  takeLoggertoRam() async {
    bool isloggedin = (await LoginFlagJson().getLoginInfo()).isloggedin;
    if (isloggedin) {
      LoginCredentials().login(await Credential().getCredential());
    } else {
      print("No User to take in Ram .Because there is no logged in user");
    }
  }
}
