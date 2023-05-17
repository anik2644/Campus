import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:social_media_app/chats/recent_chats.dart';
import 'package:social_media_app/models/post.dart';
import 'package:social_media_app/utils/constants.dart';
import 'package:social_media_app/utils/firebase.dart';
import 'package:social_media_app/widgets/indicators.dart';
import 'package:social_media_app/widgets/story_widget.dart';
import 'package:social_media_app/widgets/userpost.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}


class p{

  late String id;
  late String postId;
  late String ownerId;
  late String location;
  late String username;
  late String description;
  late String mediaUrl;
  late String timestamp;

  p(String a,String b,String c, String d,String e, String f,String h){
    this.id =a;
    this.postId =b;
    this.ownerId =c;
    this.location =d;
    this.username =e;
    this.description =f;
    this.timestamp = timestamp;
    this.mediaUrl ="https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg";
  }

 static List <PostModel> Pl =[
  PostModel("a", "b", "c", "d", "e", "f", "h"),
   PostModel("a", "b", "c", "d", "e", "f", "h"),
   PostModel("a", "b", "c", "d", "e", "f", "h"),
   PostModel("a", "b", "c", "d", "e", "f", "h"),
   PostModel("a", "b", "c", "d", "e", "f", "h"),
   PostModel("a", "b", "c", "d", "e", "f", "h"),


  // p("a", "b", "c", "d", "e", "f", "h"),
  //  p("a", "b", "c", "d", "e", "f", "h"),
  //  p("a", "b", "c", "d", "e", "f", "h"),
  //  p("a", "b", "c", "d", "e", "f", "h"),
  ];
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




  @override
  Widget build(BuildContext context) {
    print('>>>');
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          Constants.appName,
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
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
      body: RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,
        onRefresh: () =>
            postRef.orderBy('timestamp', descending: true).limit(page).get(),
        child: SingleChildScrollView(
          // controller: scrollController,
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoryWidget(),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
