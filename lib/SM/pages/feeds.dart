
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_media_app/SM/screens/view_image.dart';
import '../chats/recent_chats.dart';
import '../models/post.dart';
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

  int page = 5;
  bool loadingMore = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
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



      });

      setState(() {

      });
  }


  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    print('>>>');
    return Scaffold(
      backgroundColor: Colors.black,
      //key: scaffoldKey,
      /*
      floatingActionButton: FloatingActionButton(onPressed: () {

        fetchData();
      },),
      */
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
      /*
      RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,

        onRefresh: () =>
            postRef.orderBy('timestamp', descending: true).limit(page).get(),

        child: */
        RefreshIndicator(
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
                    height: MediaQuery.of(context).size.height,
                    child:  ListView.builder(
                      controller: scrollController,
                      itemCount: p.Pl.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
      );
  }

  @override
  bool get wantKeepAlive => true;
}
