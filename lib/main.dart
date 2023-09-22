import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> fetchUser() async {

    CollectionReference collection = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collection.get();

    querySnapshot.docs.forEach((doc) {

      print(doc.get('id'));


      String bio = doc.get('bio');
      String country = doc.get('country');
      String email = doc.get('email');
      String gender = doc.get('gender');
      String id = doc.get('id');
      String photourl = doc.get('photoUrl');
      String userName = doc.get('username');
      // String mediaUrl = doc.get('mediaUrl');


/*
      UserModel data =  UserModel("anik", "anik11556@gmail.com", "userID", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg", "e", "f", "h");
      data.username =userName;
      data.email = email;
      data.id = id;
      data.photoUrl =photourl;
      data.bio =bio;
      data.country = country;


      print(data.email);

      bool exists = UserModel.um.any((entity) => entity.email == data.email);
      if(exists)
      {
        print("already in the list");
      }
      else
      {
        print("not exist in the list");
        UserModel.um.add(data);
      }



    });

    print(UserModel.um.length);
    setState(() {
      isLoading = false;

 */
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text("done",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
