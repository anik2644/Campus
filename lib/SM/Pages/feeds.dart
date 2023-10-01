
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../JSON_Management/JSONFile.dart';
import '../ModelClass/Post.dart';
import '../ModelClass/User.dart';
import '../UI/userpost.dart';



class FeedsStrategy extends StatefulWidget {
  @override
  _FeedsStrategyState createState() => _FeedsStrategyState();
}


class _FeedsStrategyState extends State<FeedsStrategy> with AutomaticKeepAliveClientMixin{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;
  int page = 5;
  bool loadingMore = false;
  ScrollController scrollController = ScrollController();
  List<Post> posts = [];
  List<User> users = [];

  Future<void> fetchUser() async {

    JSONFile jf = JSONFile("users");
    List<Object> uka = await jf.read() ;
    users = uka as List<User>;
    users.forEach((element) {print(element.userName);});
    print("users fetch done");

    setState(() {
      isLoading = false;
    });

  }


  Future<void> fetchData() async {
    JSONFile jf = JSONFile("posts");
    List<Object> uka = await jf.read() ;
    posts = uka as List<Post>;
    posts.forEach((element) {print(element.userName);});
    print("posts fetch done");

    fetchUser();
  }

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

  @override
  Widget build(BuildContext context) {
    print('>>>');
    return Scaffold(
      backgroundColor: Colors.black,
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
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Ionicons.chatbubble_ellipses,
              size: 30.0,
            ),
            onPressed: () {},
            /*{
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => Chats(),
                ),
              );
            },*/
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
                          itemCount: posts.length,
                          shrinkWrap: true,
                          //  physics: ScrollPhysics(),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Post post = posts[index];
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
