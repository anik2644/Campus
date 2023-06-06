import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class PostModel {
  String? id;
  String? postId;
  String? ownerId;
  String? username;
  String? location;
  String? description;
  String? mediaUrl;
  String? timestamp;


  PostModel(String ID,String postID,String ownerID, String location,String USername, String Desc,String postURL){
    this.id =ID;
    this.postId =postID;
    this.ownerId =ownerID;
    this.location =location;
    this.username =USername;
    this.description =Desc;

    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('EEEE, MMMM d, \nHH:mm, yyyy' ).format(now);


    this.timestamp = formattedDateTime;
    this.mediaUrl = postURL;// "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg";
  }

  // PostModel({
  //   this.id,
  //   this.postId,
  //   this.ownerId,
  //   this.location,
  //   this.description,
  //   this.mediaUrl,
  //   this.username,
  //   this.timestamp,
  // });
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    ownerId = json['ownerId'];
    location = json['location'];
    username= json['username'];
    description = json['description'];
    mediaUrl = json['mediaUrl'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['postId'] = this.postId;
    data['ownerId'] = this.ownerId;
    data['location'] = this.location;
    data['description'] = this.description;
    data['mediaUrl'] = this.mediaUrl;

    data['timestamp'] = this.timestamp;
    data['username'] = this.username;
    return data;
  }

}
class p{

  late String id;
  late String postId;
  late String ownerId;
  late String location;
  late String username;
  late String description;
  late String mediaUrl;
  late String timestamp;

  p(String id,String postID,String ownerId, String location,String username, String description,String mediaUrl){
    this.id =id;
    this.postId =postID;
    this.ownerId =ownerId;
    this.location =location;
    this.username =username;
    this.description =description;
    this.timestamp = timestamp;
    this.mediaUrl =mediaUrl;
  }

  static List <PostModel> Pl =[
    PostModel("a3", "1", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "I am what I am.", "https://thebangladeshtoday.com/wp-content/uploads/2022/10/%E0%A6%AE%E0%A6%B9%E0%A6%AE.jpg"),
    PostModel("a6", "6",  "masudrana@gmail.com", "Dhaka,Bangladesh", "Masud", "Walking gets too boring when you learn how to fly.", "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/bltf7695f98c1f01bd9/62cbfb91c9db8842cf76cb5b/GHP_MESSI-BOOTS_16-9.jpg"),
    PostModel("a5", "5", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "It’s not my attitude, It’s my style.", "https://images.hindustantimes.com/img/2022/11/10/1600x900/selena_1668082488113_1668082488308_1668082488308.jpg"),
    PostModel("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg"),
    PostModel("a2", "3", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "Smile! It destroys who wants to destroy you.", "https://static.toiimg.com/thumb/msid-100280596,width-400,resizemode-4/100280596.jpg"),
    PostModel("a4", "4", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "I know how lucky I am to be this good-looking. ", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNIVxd6JWdI8Owa-f_ivTzgOkaJ3p2ilUcwA&usqp=CAU"),


    // p("a", "b", "c", "d", "e", "f", "h"),
    //  p("a", "b", "c", "d", "e", "f", "h"),
    //  p("a", "b", "c", "d", "e", "f", "h"),
    //  p("a", "b", "c", "d", "e", "f", "h"),
  ];
}