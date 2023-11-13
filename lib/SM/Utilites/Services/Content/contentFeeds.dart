
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_media_app/SM/posts/Content/Model/Content.dart';
import 'package:social_media_app/SM/screens/view_image.dart';
import 'package:social_media_app/SM/widgets/ContentCard.dart';
import '../../../UI/chats/recent_chats.dart';
import '../../../UI/models/post.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../UI/models/user.dart';
import '../../../UI/utils/constants.dart';
import '../../../UI/utils/firebase.dart';
import '../../../UI/widgets/story_widget.dart';
import '../../../UI/widgets/userpost.dart';

class ContentFeeds extends StatefulWidget {
  @override
  _ContentFeedsState createState() => _ContentFeedsState();
}


class _ContentFeedsState extends State<ContentFeeds> with AutomaticKeepAliveClientMixin{
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

  List<String> AllImagesList=[];
  List<String> ContentImageSequence =[];
  List<String> ContentSegments =[];
  late String Location;
  late String Title;

  Future<void> fetchData() async {

    Content.ContentList.clear();
    AllImagesList.clear();
    ContentSegments.clear();
    ContentImageSequence.clear();
    
    
    CollectionReference collection = FirebaseFirestore.instance.collection('Contents');
    QuerySnapshot querySnapshot = await collection.get();

    print(querySnapshot.docs.length);

    querySnapshot.docs.forEach((doc) {


     AllImagesList = List<String>.from(doc.get('AllImagesList'));
     ContentSegments= List<String>.from(doc.get('ContentSegments'));
     ContentImageSequence= List<String>.from(doc.get('ContentImageSequence'));
     Location = doc.get('Location');
     Title = doc.get('Title');
     
     Content data =Content(AllImagesList: AllImagesList, ContentImageSequence: ContentImageSequence, ContentSegments: ContentSegments, Location: Location, Title: Title);
     Content.ContentList.add(data);
     print(data.Title);

     setState(() {
       isLoading = false;
     });

      //   print(doc.get('id'));
      //
      //
      // String postID = doc.get('postId');
      // String description = doc.get('description');
      // String id = doc.get('id');
      // String loc = doc.get('location');
      // String ownerId = doc.get('ownerId');
      // String timestamp = doc.get('timestamp');
      // String userName = doc.get('userName');
      // String mediaUrl = doc.get('mediaUrl');
      //
      //
      // PostModel data =  PostModel("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg");
      // data.id=id;
      // data.timestamp =timestamp;
      // data.mediaUrl = mediaUrl;
      // data.description= description;
      // data.location = loc;
      // data.ownerId =ownerId;
      // data.username = userName;
      // data.postId = postID;
      //
      // print(data.description);
      //
      // bool exists = p.Pl.any((post) => post.postId == data.postId);
      // if(exists)
      // {
      //   print("already in the list");
      // }
      // else
      // {
      //   p.Pl.add(data);
      // }

    });
    print("data fetch done");
//    fetchUser();

  }


  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
      drawer:  Drawer(
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
                leading:CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://images.prothomalo.com/prothomalo-bangla/2021-01/1d75151c-eff9-4e9f-ac28-aebc4618d00f/palo_bangla_og.png',
                  ),
                ),
                title: Text('Prothom Alo',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),

                onTap: () {

                  _launchURL("www.prothomalo.com");
                  // Handle drawer item tap
                  Navigator.pop(context);
                },
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
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/C560BAQHXD8X7v34Ygg/company-logo_400_400/0/1593498509122?e=2147483647&v=beta&t=JrCVIAMRRVpGfckybkhxFjIHS_20KeqWBYTn3_qchvA',
                  ),
                ),
                title: Text('Daily Campus',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                onTap: () {
                  // Handle drawer item tap

                  _launchURL("www.thedailycampus.com");
                  Navigator.pop(context);
                },
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
                leading:  CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://i1.sndcdn.com/avatars-RGgXraz1SPFZKU7x-9uYAAQ-t500x500.jpg',
                  ),
                ),
                title: Text('Reuters',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                onTap: () {

                  _launchURL("www.reuters.com");
                  // Handle drawer item tap
                  Navigator.pop(context);
                },
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
                          itemCount: Content.ContentList.length,
                          shrinkWrap: true,
                          //  physics: ScrollPhysics(),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Content posts = Content.ContentList[index];
                            //print(index);
                            //PostModel.fromJson(docs[index].data());
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ContentCard(post: posts),
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
