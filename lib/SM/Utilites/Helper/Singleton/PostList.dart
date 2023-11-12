import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/UserList.dart';

import '../../../ModelClass/Post.dart';
import '../../../ModelClass/User.dart';

class PostList {
  final List<Post> _posts = [];
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
      return _posts[index];
    } else {
      return null; // or handle the out-of-bounds case as needed
    }
  }


  Future<List<Post>> _tempConvert(List<Post> posts) async {
    List<User> users =await UserList().getUsers();


  }

  bool isListEmpty() {
    return _posts.isEmpty;
  }

  Future<List<Post>> getPosts() async {
    return await _tempConvert(this._posts);
  }

  void setPosts(List<Post> postList) {
    _posts.clear();
    _posts.addAll(postList);
  }
}
