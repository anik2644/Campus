
import 'package:dhabiansomachar/SM/JSON_Management/Posts/JSONPostsOffice.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/PostList.dart';

import '../../Firebase/Posts/FBPostsOffice.dart';
import '../../ModelClass/Post.dart';
import '../../Utilites/Helper/Singleton/UserList.dart';

class PostsOffice {
  FBPostsOffice fbFeedsOffice = FBPostsOffice();
  JSONPostsOffice jsonPostsOffice = JSONPostsOffice();

  takeDataToRam() async {
    List<Post> posts = await _fetchPostsFromJSON();

    if (posts.isEmpty) {
      posts = await _fetchPostsFromFB();
      await jsonPostsOffice.writeToJSON_post(posts);

    }
    PostList().setPosts(posts);
  }

  Future<List<Post>> updatePosts() async {
    List<Post> posts = await _fetchPostsFromFB();
    await jsonPostsOffice.writeToJSON_post(posts);

    return posts;
  }


  Future<List<Post>> _fetchPostsFromJSON() async {
    return await jsonPostsOffice.findAllPost();
  }

  Future<List<Post>> _fetchPostsFromFB() async {
    return await fbFeedsOffice.fetchPost();
  }
}
