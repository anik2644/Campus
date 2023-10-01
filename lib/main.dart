import 'package:dhabiansomachar/SM/Firebase/FIREBASE.dart';
import 'package:dhabiansomachar/SM/Firebase/FirebaseMethods/FirebaseFetchdata.dart';
import 'package:dhabiansomachar/SM/JSON_Management/JSONFile.dart';
import 'package:dhabiansomachar/SM/ModelClass/Post.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'SM/Configuration/config.dart';
import 'SM/Utilites/life_cycle_event_handler.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.initFirebase();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {@override Widget build(BuildContext context) {return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData(primarySwatch: Colors.blue,), home: const MyHomePage(),);}}



class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dhabian Somachar"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text("done",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // JSONFile jf = JSONFile("users");
        // List<Object> uk = await jf.read() ;
        // List<User> users = uk as List<User>;
        // users.forEach((element) {print(element.userName);});

        FIREBASE fb = FIREBASE("posts");
        List<Object> uk = await fb.fetchData();
        List<Post> posts = uk as List<Post>;
        posts.forEach((element) {print(element.description);});

        print("read done\n\n");

        JSONFile jfl = JSONFile("posts");
        jfl.write(posts);

        print("write done\n\n");


        JSONFile jf = JSONFile("posts");
        List<Object> uka = await jf.read() ;
        List<Post> postss = uka as List<Post>;
        postss.forEach((element) {print(element.userName);});

      },),

    );
  }
}