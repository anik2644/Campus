import 'package:dhabiansomachar/SM/Firebase/FirebaseMethods/FirebaseFetchdata.dart';
import 'package:dhabiansomachar/SM/ModelClass/Post.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import 'SM/JSON_Management/JSONMethods.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
        actions: [IconButton(onPressed: () async {


          JSONMethods wj = JSONMethods();
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
        onPressed: () async {
          FirebaseFetchData ffd = FirebaseFetchData("users");
          List<Object> uk = await ffd.fetchdata() ;
          List<User> us = uk as List<User>;
          print("Runing from main");
          us.forEach((element) {print(element.userName);});

          print("printing fetch Post");

          FirebaseFetchData fd = FirebaseFetchData("posts");
          List<Object> ukw = await fd.fetchdata() ;
          List<Post> usw = ukw as List<Post>;
          print("Runing from main");
          usw.forEach((element) {print(element.description);});


        },//fetchUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
