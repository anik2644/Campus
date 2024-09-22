
import 'package:dhabiansomachar/SM/Firebase/Auth/FB_Auth_Service.dart';
import '../../JSON_Management/Auth/Credential.dart';
import '../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../ModelClass/LoginCredential.dart';
import '../../ModelClass/LoginFlag.dart';
import '../../ModelClass/User.dart';

class AuthJsonOffice {
  // Method to update both the login JSON flag and login credentials
  Future<void> updateAuthJson() async {
    await _updateLoginJsonFlag();
    await _updateLoginCredential();
  }

  // Private method to update the login JSON flag
  Future<void> _updateLoginJsonFlag() async {
    await LoginFlagJson().saveLoginInfo(LoginFlag(true));
  }

  // Private method to update login credentials from Firebase
  Future<void> _updateLoginCredential() async {
    FBAuthService fbAuthService = FBAuthService();

    // Get the user's credential from Firebase
    Object userCredential = await fbAuthService.getLoginCredential();
    User user = userCredential as User;
    print(user.country);

    // Save the login credentials locally
    LoginCredentials().login(user);
    JSONCredential().saveCredential(user);
  }
}
