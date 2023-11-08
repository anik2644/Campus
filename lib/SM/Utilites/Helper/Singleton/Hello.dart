class User {
  final String name;
  User(this.name);
}

class SingletonList {
  final List<User> _users = [];
  static final SingletonList _singleton = SingletonList._();

  factory SingletonList() {
    return _singleton;
  }

  SingletonList._();

  void addUser(User user) {
    _users.add(user);
  }

  List<User> getUsers() {
    return _users;
  }
}

void main() {
  // Get the SingletonList instance
  final singletonList = SingletonList();
   SingletonList m = SingletonList();
  // Create and add User instances to the list
  final user1 = User('John');
  final user2 = User('Alice');

  SingletonList().addUser(user2);
  User us3 = User("name");


  SingletonList k = SingletonList();
  singletonList.addUser(user1);
  k.addUser(us3);
  SingletonList().addUser(user2);

  // Retrieve the list of User instances
  final users = singletonList.getUsers();

  // Verify that user1 and user2 are in the same list
  print("heello done \n"); // [Instance of 'User', Instance of 'User']

  users.forEach((element) {print(element.name);});


}
