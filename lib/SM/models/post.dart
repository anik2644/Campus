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

    //
    // PostModel("a3", "1", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik","The most Histrtocial Hall, Du", "https://prod-media-eng.dhakatribune.com/uploads/2019/04/web-du-sm-hall-1554132709758.jpg"),
    // PostModel("a6", "6",  "masudrana@gmail.com", "Dhaka,Bangladesh", "Masud", "Walking gets too boring when you learn how to fly.", "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/bltf7695f98c1f01bd9/62cbfb91c9db8842cf76cb5b/GHP_MESSI-BOOTS_16-9.jpg"),
    // PostModel("a5", "5", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "Shadow of Raintree", "https://tds-images.thedailystar.net/sites/default/files/feature/images/2021/06/29/tree.jpg"),
    // PostModel("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "Thosand Tales", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTbhuj_xLQZP8AwJQnNmDoDJ4USBB2B5Nth8IjmyrdgscLNgLmToWaFpFkV-TI414w6To&usqp=CAU"),
    // PostModel("a2", "3", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "প্রেরণার 'অপরাজেয় বাংলা", "https://www.dailyjagaran.com/media/imgAll/2020October/SM/oporazeyo-bangla-20210109044043.jpg"),
    // PostModel("a4", "4", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "I know how lucky I am to be this good-looking. ", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNIVxd6JWdI8Owa-f_ivTzgOkaJ3p2ilUcwA&usqp=CAU"),


    // p("a", "b", "c", "d", "e", "f", "h"),
    //  p("a", "b", "c", "d", "e", "f", "h"),
    //  p("a", "b", "c", "d", "e", "f", "h"),
    //  p("a", "b", "c", "d", "e", "f", "h"),
  ];
}