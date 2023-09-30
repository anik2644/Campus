import 'dart:ffi';

import 'package:dhabiansomachar/SM/JSON_MNG/jsonFunction.dart';
import 'package:dhabiansomachar/SM/JSON_MNG/model/testJson.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

    print("hello world");
    CollectionReference collection = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collection.get();


    querySnapshot.docs.forEach((doc) {

     // print(doc.get('id'));


      String bio = doc.get('bio');
      String country = doc.get('country');
      String email = doc.get('email');
      String gender = doc.get('gender');
      String id = doc.get('id');
      bool isOnline = doc.get('isOnline');
      Timestamp lastSeen = doc.get('lastSeen');
      String photoUrl = doc.get('photoUrl');
      String userName = doc.get('username');
      Timestamp time =  doc.get('time');


      User curUser = new  User.Complete(userName,email,country,bio,gender,photoUrl,id,lastSeen,isOnline,time);
      bool exists = User.users.any((entity) => entity.email == curUser.email);

      // print(curUser.userName);
      // //print(DateFormat("MMMM d, y 'at' h:mm:ss a 'UTC'z").format(curUser.lastSeen.toDate()).toString());
      // print(curUser.time.toDate());
      if(exists)
      {
        print("already in the list");
      }
      else
      {
        print("not exist in the list");
        User.users.add(curUser);
      }

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


    print(User.users.length);


    JsonMethods wj = JsonMethods();
    wj.writeToJSON(User.users);


    print("writeDOne");


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
        actions: [IconButton(onPressed: () async {


          JsonMethods wj = JsonMethods();
          List<User> rJ= await wj.readFromJSON();
          
          print("run From MAin");

          rJ.forEach((element) {
            print(element.userName);
          });
         // print("Read done");

        }, icon: Icon(Icons.add))],
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
