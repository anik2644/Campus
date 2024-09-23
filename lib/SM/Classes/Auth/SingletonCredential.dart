import '../../ModelClass/User.dart';

class SingletonCredential {
  User? loggedInUser; // This will store the currently logged-in user

  SingletonCredential._privateConstructor();

  static final SingletonCredential _instance = SingletonCredential._privateConstructor();

  factory SingletonCredential() {
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
