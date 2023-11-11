
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/Firebase/FirebaseMethods/FirebaseFetchdata.dart';
import 'package:dhabiansomachar/SM/ModelClass/LoginCredential.dart';
import 'package:dhabiansomachar/SM/UI/Pages/profile.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/SentWant.dart';
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
         PostList().setPosts(await GetWant().getAllPostfromJson());
         UserList().setUsers( await GetWant().getAllUserfromJson());
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          //SentWant().sentAllUsertoJson();
          PostList().getPosts().forEach((element) {print(element.ownerEmail);});
        },

      ),
      drawer:
      /* Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 90,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://cdn3.iconfinder.com/data/icons/eziconic-v1-0/256/02.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Portals Here !!!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                /* Expanded(
                    child: Text(
                      'Follow here to be updated..',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),*/
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // Adjust the position of the shadow
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Back',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
              onTap: () {
                // Handle drawer item tap
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),*/
      FeedsDrawer(),
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
              onRefresh: (){ return Future(() => null);},// fetchData,
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

  @override
  bool get wantKeepAlive => true;
}
