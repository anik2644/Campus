import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? username;
  String? email;
  String? photoUrl;
  String? country;
  String? bio;
  String? id;
  Timestamp? signedUpAt;
  Timestamp? lastSeen;
  bool? isOnline;

 static String? getPhotourl(String email)
 {

   int matchedIndex = um.indexWhere((item) => item.email == email);

   if (matchedIndex != -1) {
     return um[matchedIndex].photoUrl;

   } else {
     return "https://pbs.twimg.com/profile_images/1263848725736157184/o7_sJkKY_400x400.jpg";
   }
   // for(int i=0;i<um.length;i++)
   //   {
   //
   //   }
 }


  static int getUserIndex(String email)
  {

    int matchedIndex = um.indexWhere((item) => item.email == email);

    if (matchedIndex != -1) {
      return matchedIndex;

    } else {
      return 0;
    }
    // for(int i=0;i<um.length;i++)
    //   {
    //
    //   }
  }


  static Future<void> UserRefresh() async {

    UserModel.um.clear();
    CollectionReference collection = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collection.get();

    print(querySnapshot.docs.length);

    querySnapshot.docs.forEach((doc) {

      //   print(doc.get('id'));


      String bio = doc.get('bio');
      String country = doc.get('country');
      String email = doc.get('email');
      String gender = doc.get('gender');
      String id = doc.get('id');
      String photourl = doc.get('photoUrl');
      String userName = doc.get('userName');
      // String mediaUrl = doc.get('mediaUrl');


      UserModel data =  UserModel("anik", "anik11556@gmail.com", "userID", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg", "e", "f", "h");
      data.username =userName;
      data.email = email;
      data.id = id;
      data.photoUrl =photourl;
      data.bio =bio;
      data.country = country;

      // data.timestamp =timestamp;
      // data.mediaUrl = mediaUrl;
      // data.description= description;
      // data.location = loc;
      // data.ownerId =ownerId;
      // data.username = userName;
      // data.postId = postID;

      print(data.email);

      bool exists = UserModel.um.any((entity) => entity.email == data.email);
      if(exists)
      {
        print("already in the list");
      }
      else
      {
        UserModel.um.add(data);
      }



    });
  }



  static List <UserModel> um = [
    UserModel("anik", "anik11556@gmail.com", "userID", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg", "e", "f", "h"),
    UserModel("masud", "masudrana@gmail.com", "userID", "https://i.guim.co.uk/img/media/b10f15a0955d23826586810847cc3431e36616f1/0_508_2065_1238/master/2065.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=b6b0e2df577f6dc993d68b672483ef58", "e", "f", "h"),
    UserModel("mhd", "mhdank15865@gmail.com", "userID", "https://pbs.twimg.com/media/CktAAjwWsAEQawS.jpg", "e", "f", "h"),

  ];

  UserModel(String a,String b,String c, String d,String e, String f,String h){
    this.username= a;
    this.email=b;
    this.id=c;
    this.photoUrl= d;
    this.signedUpAt= Timestamp.now();
    this.isOnline= true;
    this.lastSeen= Timestamp.now();
    this.bio =" desription";
    this.country ="Bangfladesh";
  }

  // UserModel(
  //     {this.username,
  //     this.email,
  //     this.id,
  //     this.photoUrl,
  //     this.signedUpAt,
  //     this.isOnline,
  //     this.lastSeen,
  //     this.bio,
  //     this.country});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    country = json['country'];
    photoUrl = json['photoUrl'];
    signedUpAt = json['signedUpAt'];
    isOnline = json['isOnline'];
    lastSeen = json['lastSeen'];
    bio = json['bio'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['country'] = this.country;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['bio'] = this.bio;
    data['signedUpAt'] = this.signedUpAt;
    data['isOnline'] = this.isOnline;
    data['lastSeen'] = this.lastSeen;
    data['id'] = this.id;
    return data;
  }
}
