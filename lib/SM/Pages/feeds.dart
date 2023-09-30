
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';



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
    print(querySnapshot.docs.length);print(querySnapshot.docs.length);print(querySnapshot.docs.length);print(querySnapshot.docs.length);
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



      Post post = Post("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg","done");

      post.id =id;
      post.timestamp  =timestamp;
      post.mediaUrl = mediaUrl;
      post.description == description;
      post.location  = loc;
      post.ownerId  =ownerId;
      post.userName  = userName;
      post.postId  = postID;


      bool exists = Post.AllPosts.any((post) => post.postId == post.postId);
      if(exists)
      {
        print("already in the list");
      }
      else
      {
        Post.AllPosts.add(post);
      }
    });


    print("data fetch done");
    JsonMethods jm = new JsonMethods();
    jm.writeToJSON(Post.AllPosts);

    fetchUser();
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
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: UserPost(post: posts),
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
