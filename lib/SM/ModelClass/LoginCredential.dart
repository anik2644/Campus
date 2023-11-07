import 'User.dart';

class LoginCredentials {
  User? loggedInUser; // This will store the currently logged-in user

  LoginCredentials._privateConstructor();

  static final LoginCredentials _instance = LoginCredentials._privateConstructor();

  factory LoginCredentials() {
    return _instance;
  }

  void login(User user) {
    print("login done");
    loggedInUser = user;
   // print(loggedInUser!.email);
  }

  void logout() {
    print("logout done");
    loggedInUser = null;
  }

  bool isLoggedIn() {
    return loggedInUser != null;
  }
}
