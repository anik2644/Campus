import '../../../ModelClass/Post.dart';

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



  bool isListEmpty() {
    return _posts.isEmpty;
  }

  List<Post> getPosts() {
    return _posts;
  }

  void setPosts(List<Post> postList) {
    _posts.clear();
    _posts.addAll(postList);
  }
}
