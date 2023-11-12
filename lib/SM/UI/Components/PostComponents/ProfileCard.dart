import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ionicons/ionicons.dart';

import '../../../ModelClass/Post.dart';

class ProfileCard extends StatefulWidget {
  final Post post;
  const ProfileCard({required this.post});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.post!.ownerEmail);
      },
      child: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post!.userName!,
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Icon(Ionicons.mail, size: 15.0),
                          SizedBox(width: 8.0),
                          Text(
                            // Timestamp.now().toDate().toString(),
                            widget.post!.ownerEmail!, //timeago.format(widget.post!.timestamp!.toDate()),
                          ),
                        ],
                      ),
                      /* Row(
                          children: [
                            Icon(Ionicons.alarm_outline, size: 13.0),
                            SizedBox(width: 3.0),
                            Text(
                              Timestamp.now().toDate().toString(),
                              //widget.post?.timestamp as String,//timeago.format(widget.post!.timestamp!.toDate()),
                            ),
                          ],
                        ),*/
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 20.0, // Adjust the radius as needed
                    backgroundImage: CachedNetworkImageProvider(widget.post!
                        .ownerPhotoUrl!), // Use the correct field for the image URL
                  ),
                  // buildLikeButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
