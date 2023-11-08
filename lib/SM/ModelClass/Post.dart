import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  static List<Post> posts = [];

  final String? id;
  final String? postId;
  final String? userName;
  final String? ownerId;
  late String? location;
  final String? timestamp;
  late String? mediaUrl;
  late String? description;
  late String? ownerEmail;
  late String? ownerPhotoUrl;

  Post(this.id, this.postId, this.userName, this.ownerId, this.timestamp);
  Post.Complete(this.id, this.postId, this.userName, this.ownerId, this.location, this.timestamp, this.mediaUrl, this.description, this.ownerEmail, this.ownerPhotoUrl);



}