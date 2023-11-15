import 'package:dhabiansomachar/SM/Utilites/Helper/SpecificSent.dart';

import '../../../ModelClass/Post.dart';
import '../../../ModelClass/User.dart';

class SendDataToFirebase{

  sentSingleUser(User user) async {
    await SendToFbase().sendUser(user);

  }
  sentSinglePost(Post post) async {
    await SendToFbase().sendPost(post);
  }
}