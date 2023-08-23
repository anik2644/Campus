 class Post{

    String s ="s";
   String id;
   String postId;
   String userName;
   String ownerId;
   String location;
   String timestamp;
   String mediaUrl;
   String description;
  Post(this.id, this.postId, this.userName, this.ownerId, this.location, this.timestamp, this.mediaUrl, this.description);



   Map<String, dynamic> toJson() => {



     // 'id': s,
     // 'postId':s,
     // 'userName':s,
     // 'ownerId':s,
     // 'location':s,
     // 'timestamp':s,
     // 'mediaUrl':s,
     'description':s,
     'id': id,
     'postId':postId,
     'userName':userName,
     'ownerId':ownerId,
     'location':location,
     'timestamp':timestamp,
     'mediaUrl':mediaUrl,
     'description':description,

   };

    Post.fromJson(Map<String, dynamic> json,)
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


    Post runFun(String id, String postId, String userName, String ownerId, String location, String timestamp, String mediaUrl, String description,) {
      Post p = new Post(id, postId, userName, ownerId, location, timestamp, mediaUrl, description);
      print('runFun called with postId: $postId, userName: $userName');

      return p;
    }

   static List <Post> AllPosts =[
    Post("a3", "1", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "I am what I am.", "https://thebangladeshtoday.com/wp-content/uploads/2022/10/%E0%A6%AE%E0%A6%B9%E0%A6%AE.jpg","done"),
    Post("a", "2", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "All my focus is on the good.", "https://devdiscourse.blob.core.windows.net/devnews/17_07_2019_19_18_59_861541.jpg","done"),
    Post("a2", "3", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "Smile! It destroys who wants to destroy you.", "https://static.toiimg.com/thumb/msid-100280596,width-400,resizemode-4/100280596.jpg","done"),
    Post("a4", "4", "anik11556@gmail.com", "Dhaka,Bangladesh", "Anik", "I know how lucky I am to be this good-looking. ", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr8VI65VyGySt8B_pF86KcP2z7mGZgkBSa_w&usqp=CAU","done"),
    Post("a5", "5", "mhdank15865@gmail.com", "Dhaka,Bangladesh", "Mhd", "It’s not my attitude, It’s my style.", "https://images.hindustantimes.com/img/2022/11/10/1600x900/selena_1668082488113_1668082488308_1668082488308.jpg","done"),
    Post("a6", "6",  "masudrana@gmail.com", "Dhaka,Bangladesh", "Masud", "Walking gets too boring when you learn how to fly.", "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/bltf7695f98c1f01bd9/62cbfb91c9db8842cf76cb5b/GHP_MESSI-BOOTS_16-9.jpg","done"),

  ];
 }