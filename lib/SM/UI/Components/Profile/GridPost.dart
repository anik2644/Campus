import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ModelClass/Post.dart';
import '../../../Utilites/Helper/Singleton/PostList.dart';
import '../ProfilePage/PostTile.dart';

class PostGrid extends StatefulWidget {
  final profileId;
  final email;


  PostGrid({this.profileId, this.email});

  @override
  State<PostGrid> createState() => _PostGridState();
}

class _PostGridState extends State<PostGrid> {

  List<Post> filteredlist =[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMypost();
  }


  @override
  Widget build(BuildContext context) {
    return isLoading? CircularProgressIndicator():buildPostView();
  }


  buildPostView() {
    return buildGridPost();
  }

  /* buildGridPost() {
    //print("object");
   // print(widget.email);

    return StreamGridWrapper(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      stream: postRef
          .where('ownerId', isEqualTo: widget.email)
          //.orderBy('timestamp', descending: true)
          .snapshots(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, DocumentSnapshot snapshot) {
        PostJsonModel posts = PostJsonModel.fromJson(snapshot.data() as Map<String, dynamic>);
        return PostTile(
          post: posts ,ii: 1,
        );
      },
    );
  }
*/

  buildGridPost() {
    return GridView.builder(
      shrinkWrap: true, // Add this line
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: filteredlist.length,
      itemBuilder: (context, index) {
        Post post = filteredlist[index];
        return PostTile(post: post, ii: 1);
      },
    );
  }


  Future<void> fetchMypost() async {

    //List<Post> posts = PostList().getPosts();//await FacadeJson().findAllPost();
/*
    print("printing list");
    print( widget.email);
    posts.forEach((element) {print(element.ownerEmail);});
*/

    filteredlist = PostList().getPosts().where((post) => post.ownerId == widget.profileId).toList();

    //print(filteredlist.length);
    //filteredlist.forEach((element) {print(element.description);});


    setState(() {
      isLoading = false;
    });

  }
}
