import 'package:flutter/cupertino.dart';
import '../../../../ModelClass/Post.dart';

import '../custom_image.dart';

class ImageCard extends StatelessWidget {
  final Post? post;
  ImageCard(this.post);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0),
      ),

      child: CustomImage(
        imageUrl: post?.mediaUrl ?? '',
        height: 350.0,
        fit: BoxFit.cover,
        width: double.infinity,
      ),


    );
    ;
  }
}