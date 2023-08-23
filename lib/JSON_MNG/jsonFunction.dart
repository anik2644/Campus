import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_media_app/JSON_MNG/model/JsonPostModel.dart';
import 'dart:async';

import '../SM/posts/Post.dart';
import 'model/User.dart';

class JsonMethods{


  List<Post> postss = [];

  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }
  Future<File> get _localFile async{
    final path = await _localpath;
    print(path.toString());
    print("myPath");
    return File("$path/Posts.json");

  }

  Future<Object> readCounter() async{
    try{

      final file = await _localFile;
      String contents = await file.readAsString();
      final list = json.decode(contents) as List<dynamic> ;

      List<User> allUser = list.map((e) => User.fromJson(e)).toList() as List<User>;
      //
      // for(int i=0; i<allUser.length;i++)
      // {
      //   print(allUser[i].name);
      // }
      return list.map((e) => User.fromJson(e)).toList();
    }
    catch(e)
    {
      print(e);
      return e.toString();
    }
  }

  Future<File> writeCounter(List<Post> posts) async{

    final file= await _localFile;
    Post post = Post("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg","done");
  //  posts.add(p);
    print(posts.length);
    print("hello done");
    posts.forEach((element) {postss.add(post);});

    postss.map((post) => post.toJson()).toList();

    //posts.forEach((element) {print(element);});
    //var var1 = json.encode(postss);
    /*
    User us = User("name", "email");
    List<User> ul =[];
    ul.add(us);
    ul.add(us);

    ul.map((user) => user.toJson()).toList();
    //posts.forEach((element) {print(element);});
    */
    var var1 = json.encode(postss);

    print(var1.toString());
    print("hello done");
    return file.writeAsString('$var1');
  }


}

/*


void main() {
  runApp(const MyApp());
}
class CounterStroge{

  List<User> users = [];

  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }
  Future<File> get _localFile async{
    final path = await _localpath;
    print(path.toString());
    print("myPath");
    return File("$path/TOP.json");

  }


  Future<Object> readCounter() async{
    try{

      final file = await _localFile;
      String contents = await file.readAsString();
      final list = json.decode(contents) as List<dynamic> ;

      List<User> allUser = list.map((e) => User.fromJson(e)).toList() as List<User>;

      for(int i=0; i<allUser.length;i++)
      {
        print(allUser[i].name);
      }
      return list.map((e) => User.fromJson(e)).toList();
    }
    catch(e)
    {
      print(e);
      return e.toString();
    }
  }

  Future<File> writeCounter(int counter) async{

    final file= await _localFile;
    User us = new User("Mhd$counter", "annonymous");
    users.add(us);
    print(users.length);

    users.map((user) => user.toJson()).toList();
    var var1 = json.encode(users);
    print(var1.toString());

    return file.writeAsString('$var1');
  }
}

class StaticVariables {
  static String st= "User.json";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),//Home(),// const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CounterStroge stroge = CounterStroge();

  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String dis= "nothing";

  @override
  void initState(){
    widget.stroge.readCounter().then((value) => {
      setState((){
      })
    });
  }

  Future<File> _incrementCounter(){
    _counter++;
    setState(() {

      widget.stroge.readCounter().then((value) => {
        setState((){
        })
      });
    });

    return widget.stroge.writeCounter(_counter);

  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: widget.stroge.readCounter(),
        builder: (context,data){
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items =data.data as List<User>;
            return ListView.builder(
                itemCount: items == null? 0: items.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            // child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                          ),
                          Expanded(child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].name.toString(),style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),),),
                                Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].email.toString()),)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );


  }

 */
}


*/