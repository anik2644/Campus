import 'dart:io';

import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/UserList.dart';

import '../../../ModelClass/Post.dart';
import '../../../ModelClass/User.dart';

class PostList {
  late final List<Post> _posts = [];
  static final PostList _singletonPostList = PostList._();

  factory PostList() {
    return _singletonPostList;
  }

  PostList._();

  void addPost(Post post) {
    _posts.add(post);
  }

  Post? getPostAtIndex(int index) {
    if (index >= 0 && index < _posts.length) {
      List<User> users =  UserList().getUsers();
      Post post = _posts[index];

      for(User user in users) {
        if (post.ownerId == user.id) {
          post.userName = user.userName;
          post.ownerPhotoUrl = user.photoUrl;

          break;
        }
      }

      return post;
    } else {
      return null; // or handle the out-of-bounds case as needed
    }
  }

/*

  Future<List<Post>> _tempConvert(List<Post> posts) async {
    List<User> users =await UserList().getUsers();
    for (Post post in posts) {

      for(User user in users)
        {
          if (post.ownerId == user.id) {

            post.userName = user.userName;
            post.ownerPhotoUrl = user.photoUrl;

            break;
        }

      }
    }
    PostList._().setPosts(posts);
    return posts;

  }
*/

  bool isListEmpty() {
    return _posts.isEmpty;
  }
/*

  Future<List<Post>> getPosts() async {
    return await _tempConvert(this._posts);
  }
*/

  List<Post> getPosts() {
    return _posts;
  }

  void setPosts(List<Post> postList) {
    _posts.clear();
    _posts.addAll(postList);
  }
}
