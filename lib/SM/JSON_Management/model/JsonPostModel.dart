
class JsonPostModel {
  Post post;
   String s ="hello";
  late String id;
  late String postId;
  late String userName;
  late String ownerId;
  late String location;
  late String timestamp;
  late String mediaUrl;
  late String description;

  JsonPostModel(this.post);

  JsonPostModel.fromJson(Map<String, dynamic> json, this.post)
      : postId = json['postId'],
        id = json['id'],
        userName = json['userName'],
        ownerId = json['ownerId'],
        location = json['location'],
        timestamp = json['timestamp'],
        mediaUrl = json['mediaUrl'],
        description = json['description'] {
    // TODO: implement User.fromJson
    runFun(id, postId, userName, ownerId, location, timestamp, mediaUrl,
        description);
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() => {



    'id': s,
    'postId':s,
    'userName':s,
    'ownerId':s,
    'location':s,
    'timestamp':s,
    'mediaUrl':s,
    'description':s,
    // 'id': this.post.id,
    // 'postId':this.post.postId,
    // 'userName':this.post.userName,
    // 'ownerId':this.post.ownerId,
    // 'location':this.post.location,
    // 'timestamp':this.post.timestamp,
    // 'mediaUrl':this.post.mediaUrl,
    // 'description':this.post.description,

      };


  Post runFun(String id, String postId, String userName, String ownerId, String location, String timestamp, String mediaUrl, String description,) {
    Post p = new Post(id, postId, userName, ownerId, location, timestamp, mediaUrl, description);
    print('runFun called with postId: $postId, userName: $userName');

    return p;
  }
}
