
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_media_app/SM/posts/Post.dart';
import 'package:social_media_app/SM/screens/view_image.dart';
import '../chats/recent_chats.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/firebase.dart';
import '../widgets/story_widget.dart';
import '../widgets/userpost.dart';
// import 'package:social_media_app/chats/recent_chats.dart';
// import 'package:social_media_app/models/post.dart';
// import 'package:social_media_app/utils/constants.dart';
// import 'package:social_media_app/utils/firebase.dart';
// import 'package:social_media_app/widgets/indicators.dart';
// import 'package:social_media_app/widgets/story_widget.dart';
// import 'package:social_media_app/widgets/userpost.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}



//
// id = json['id'];
// postId = json['postId'];
// ownerId = json['ownerId'];
// location = json['location'];
// username= json['username'];
// description = json['description'];
// mediaUrl = json['mediaUrl'];
// timestamp = json['timestamp'];
//
//
//



class _FeedsState extends State<Feeds> with AutomaticKeepAliveClientMixin{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;
  int page = 5;
  bool loadingMore = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {

    fetchData();
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

  Future<void> fetchUser() async {

    //print("hey in userfeth upper");
      UserModel.um.clear();
    CollectionReference collection = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collection.get();

    // print("hey in userfeth");
    // print(querySnapshot.docs.length );
    // print("hey in fetchh");
    //
    // int i=0;

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


      UserModel data =  UserModel("anik", "anik11556@gmail.com", "userID", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg", "e", "f", "h");
      data.username =userName;
      data.email = email;
      data.id = id;
      data.photoUrl =photourl;
      data.bio =bio;
      data.country = country;

      // data.timestamp =timestamp;
      // data.mediaUrl = mediaUrl;
      // data.description= description;
      // data.location = loc;
      // data.ownerId =ownerId;
      // data.username = userName;
      // data.postId = postID;

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
    });

  }


  Future<void> fetchData() async {
    CollectionReference collection = FirebaseFirestore.instance.collection('all_Posts');
    QuerySnapshot querySnapshot = await collection.get();

    print(querySnapshot.docs.length);

    querySnapshot.docs.forEach((doc) {

      //   print(doc.get('id'));


      String postID = doc.get('postId');
      String description = doc.get('description');
      String id = doc.get('id');
      String loc = doc.get('location');
      String ownerId = doc.get('ownerId');
      String timestamp = doc.get('timestamp');
      String userName = doc.get('userName');
      String mediaUrl = doc.get('mediaUrl');


      PostModel data =  PostModel("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg");
      data.id=id;
      data.timestamp =timestamp;
      data.mediaUrl = mediaUrl;
      data.description= description;
      data.location = loc;
      data.ownerId =ownerId;
      data.username = userName;
      data.postId = postID;

      print(data.postId);
      print(data.description);

      bool exists = p.Pl.any((post) => post.postId == data.postId);
      if(exists)
      {
        print("already in the list");
      }
      else
      {
        p.Pl.add(data);
      }

      // fetchUser();

    });
    print("data fetch done");
    fetchUser();

    // setState(() {
    //   isLoading = false;
    // });
  }


  //List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  /*
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: UserModel.UserRefresh(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Scaffold(
            body: PageTransitionSwitcher(
              transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  ) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: pages[_page]['page'],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
                  for (Map item in pages)
                    item['index'] == 2
                        ? buildFab()
                        : Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: IconButton(
                        icon: Icon(
                          item['icon'],
                          color: item['index'] != _page
                              ? Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black
                              : Theme.of(context).colorScheme.secondary,
                          size: 25.0,
                        ),
                        onPressed: () => navigationTapped(item['index']),
                      ),
                    ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          );
        }
      },
    );
  }
 */



  @override
  Widget build(BuildContext context) {
    print('>>>');
    return Scaffold(
      backgroundColor: Colors.black,
      //key: scaffoldKey,

      // floatingActionButton: FloatingActionButton(onPressed: () {
      //
      //   print("Current USer");
      //   print(firebaseAuth.currentUser!.email);//firebaseAuth.currentUser
      //   //fetchData();
      // },),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(
          "ঢাবিয়ান সমাচার",//"Press me to enter",
          style: TextStyle(fontSize: 30,color: Colors.black, fontFamily: 'Alkatra',),
        ).animate(

          //delay: 1000.ms, // this delay only happens once at the very start
          onPlay: (controller) => controller.repeat(), // loop
        ).fadeIn(duration: 1500.ms).fadeOut(delay: 3500.ms, duration: 200.ms) // runs after fade.),
      ,
        // title: Text(
        //   Constants.appName,
        //   style: TextStyle(
        //     fontWeight: FontWeight.w900,
        //   ),
        // ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Ionicons.chatbubble_ellipses,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => Chats(),
                ),
              );
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body:
      Stack(
        children: [
          Visibility(
            visible: !isLoading,
            child: RefreshIndicator(
                  onRefresh: fetchData,
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
                            itemCount: p.Pl.length,
                            shrinkWrap: true,
                           //  physics: ScrollPhysics(),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              PostModel posts = p.Pl[index];
                              //print(index);
                              //PostModel.fromJson(docs[index].data());
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: UserPost(post: posts),
                              );
                            },
                          )
                        /*FutureBuilder(
                          future: postRef
                              .orderBy('timestamp', descending: true)
                              .limit(page)
                              .get(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              var snap = snapshot.data;
                              List docs = snap!.docs;
                              return ListView.builder(
                                controller: scrollController,
                                itemCount: docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  PostModel posts =
                                      PostModel.fromJson(docs[index].data());
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: UserPost(post: posts),
                                  );
                                },
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return circularProgress(context);
                            } else
                              return Center(
                                child: Text(
                                  'No Feeds',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                          },
                        ),*/
                      ),
                    ],
                  ),
                ),

                /*
                SingleChildScrollView(
                  // controller: scrollController,
                  //physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //StoryWidget(),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child:  ListView.builder(
                          controller: scrollController,
                          itemCount: p.Pl.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            PostModel posts = p.Pl[index];
                            //PostModel.fromJson(docs[index].data());
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: UserPost(post: posts),
                            );
                          },
                        )
                        /*FutureBuilder(
                          future: postRef
                              .orderBy('timestamp', descending: true)
                              .limit(page)
                              .get(),
                          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              var snap = snapshot.data;
                              List docs = snap!.docs;
                              return ListView.builder(
                                controller: scrollController,
                                itemCount: docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  PostModel posts =
                                      PostModel.fromJson(docs[index].data());
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: UserPost(post: posts),
                                  );
                                },
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return circularProgress(context);
                            } else
                              return Center(
                                child: Text(
                                  'No Feeds',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                          },
                        ),*/
                      ),
                    ],
                  ),
                ),
                 */
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

      /*
      RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,

        onRefresh: () =>
            postRef.orderBy('timestamp', descending: true).limit(page).get(),

        child: */
      );
  }

  @override
  bool get wantKeepAlive => true;
}
