import '../../ModelClass/Post.dart';

class PostJsonModel {

  final String? id;
  final String? postId;
  final String? userName;
  final String? ownerId;
  final String? location;
  final String? timestamp;
  final String? mediaUrl;
  final String? description;
  final String? ownerEmail;
  final String? ownerPhotoUrl;

  PostJsonModel(this.id, this.postId, this.userName, this.ownerId, this.location, this.timestamp, this.mediaUrl, this.description,this.ownerEmail,this.ownerPhotoUrl);




  PostJsonModel.fromJson(Map<String, dynamic> json)
      : postId = json['postId'],
        id = json['id'],
        userName = json['userName'],
        ownerId = json['ownerId'],
        location = json['location'],
        timestamp = json['timestamp'],
        mediaUrl = json['mediaUrl'],
        description = json['description'],
        ownerEmail = json['ownerEmail'],
        ownerPhotoUrl = json['ownerPhotoUrl']
  ;

  Map<String, dynamic> toJson() => {

    'id': id,
    'postId':postId,
    'userName':userName,
    'ownerId':ownerId,
    'location':location,
    'timestamp':timestamp,
    'mediaUrl':mediaUrl,
    'description':description,
    'ownerEmail' : ownerEmail,
    'ownerPhotoUrl' : ownerPhotoUrl
  };
}
