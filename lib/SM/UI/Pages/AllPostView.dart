import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/JSON_Management/model/PostJsonModel.dart';
import 'package:dhabiansomachar/SM/ModelClass/Post.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../Utilites/Constants/firebase.dart';
import '../Components/FeedComponents/userpost.dart';
import '../widgets/indicators.dart';

// import 'package:social_media_app/models/post.dart';
// import 'package:social_media_app/utils/firebase.dart';
// import 'package:social_media_app/widgets/indicators.dart';
// import 'package:social_media_app/widgets/userpost.dart';

class AllPostView extends StatefulWidget {
  final userId;

  final email;

  const AllPostView({Key? key, required this.userId, required this.email})
      : super(key: key);

  @override
  State<AllPostView> createState() => _AllPostViewState();
}

class _AllPostViewState extends State<AllPostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Ionicons.chevron_back),
        ),
        title: Column(
          children: [
            Text(
              widget.email.toUpperCase(),
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              'Posts',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: postRef
              .where('ownerId', isEqualTo: widget.email)
          // .orderBy('timestamp', descending: true)
              .get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var snap = snapshot.data;
              List docs = snap!.docs;
              return ListView.builder(
                itemCount: docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PostJsonModel posts = PostJsonModel.fromJson(docs[index].data());
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: UserPost(post: converTopost(posts)),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
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
        ),
      ),
    );
  }

  Post converTopost(PostJsonModel element)
  {
    //Post post;
    return Post.Complete(element.id, element.postId, element.userName!, element.ownerId!, element.location!, element.timestamp!, element.mediaUrl!,element.description);
  }
}
