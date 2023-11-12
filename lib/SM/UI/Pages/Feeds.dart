
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/Firebase/FirebaseMethods/FirebaseFetchdata.dart';
import 'package:dhabiansomachar/SM/ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/UI/Pages/profile.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/SentWant.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/UpdateWant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../Firebase/Auth/FetchCredential.dart';
import '../../Firebase/FIREBASE.dart';
import '../../JSON_Management/JSONFile.dart';
import '../../ModelClass/Post.dart';
import '../../ModelClass/User.dart';
import '../../Utilites/Helper/GetWant.dart';
import '../../Utilites/Helper/Singleton/PostList.dart';
import '../../Utilites/Helper/Singleton/UserList.dart';
import '../../Utilites/Helper/SpecificWant.dart';
import '../Components/Feed/FeedsDrawer.dart';
import '../Components/FeedComponents/userpost.dart';



class Feeds extends StatefulWidget {


  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> with AutomaticKeepAliveClientMixin{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;
  int page = 5;
  bool loadingMore = false;
  ScrollController scrollController = ScrollController();
 // List<Post> posts = [];
 //  List<User> users = [];
/*
  Future<void> fetchUser() async {

    JSONFile jf = JSONFile("users");
    List<Object> uka = await jf.read() ;
    users = uka as List<User>;
   // users.forEach((element) {print(element.userName);});
    //print("users fetch done");

    setState(() {
      isLoading = false;
    });

  }


  Future<void> fetchData() async {
    JSONFile jf = JSONFile("posts");
    List<Object> uka = await jf.read() ;
    posts = uka as List<Post>;
   /* posts.forEach((element) {
      print(element.userName);});*/
    print("posts fetch done");

    fetchUser();
  }
*/
   Future<void> takeDataToRam() async {

     if(UserList().isListEmpty()||PostList().isListEmpty())
       {

         UserList().setUsers( await GetWant().getAllUserfromJson());
         PostList().setPosts(await GetWant().getAllPostfromJson());
       }
     setState(() => isLoading =false);
   }


  @override
  void initState() {
    isLoading = true;
    takeDataToRam();
   // fetchData();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          page = page + 5;
          loadingMore = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('>>>');
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
/*      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          //SentWant().sentAllUsertoJson();
          PostList().getPosts().forEach((element) {print(element.ownerEmail);});
        },

      ),*/
      drawer: FeedsDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title:  Text(
          "ঢাবিয়ান সমাচার",//"Press me to enter",
          style: TextStyle(fontSize: 30,color: Colors.black, fontFamily: 'Alkatra',),
        ),
/*
            .animate(

          //delay: 1000.ms, // this delay only happens once at the very start
          onPlay: (controller) => controller.repeat(), // loop
        ).fadeIn(duration: 1500.ms).fadeOut(delay: 3500.ms, duration: 200.ms) // runs after fade.),
        ,*/
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Ionicons.person,
              size: 30.0,
            ),
            onPressed: ()
            {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) =>  Profile(user: LoginCredentials().loggedInUser,),
                ),
              );
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Stack(
        children: [
          Visibility(
            visible: !isLoading,
            child: RefreshIndicator(
              onRefresh:  _refreshData,// fetchData,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                // controller: scrollController,
                //physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //StoryWidget(),
                    Container(
                      //height: MediaQuery.of(context).size.height,
                        child:  ListView.builder(
                          controller: scrollController,
                          itemCount: PostList().getPosts().length,
                          shrinkWrap: true,
                          //  physics: ScrollPhysics(),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Post? post = PostList().getPostAtIndex(index);;
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: UserPost(post: post),
                            );
                          },
                        )
                    ),
                  ],
                ),
              ),

            ),
          ),
          Visibility(
            visible: isLoading,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),

    );
  }

  Future<void> _refreshData() async {

     await UpdateWant().updateJsonPosts();
     await UpdateWant().updateJsonUsers();
     PostList().setPosts(await GetWant().getAllPostfromJson());
     UserList().setUsers( await GetWant().getAllUserfromJson());
     setState((){

     });

    // Run the two asynchronous functions here
    //await takeDataToRam();
    // Add more asynchronous calls as needed
  }


  @override
  bool get wantKeepAlive => true;
}
