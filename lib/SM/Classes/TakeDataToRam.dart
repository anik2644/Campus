import '../ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import '../JSON_Management/Auth/Credential.dart';
class TakeDataToRam {
  JSONCredential jsonCredential = JSONCredential();


  Future<void> authData() async {
    User user = await jsonCredential.getCredential();
    LoginCredentials().login(user);
  }


  void users() {

  }

  void posts() {

  }
}
