import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../ModelClass/Post.dart';
import '../model/PostJsonModel.dart';

class FacadeJson{

  Future<List<Post>> findAllPost()
  async {
   // JSONFile jf = JSONFile("posts");
    List<Object> uka = await readFromJSON_post() ;
    List<Post> postss = uka as List<Post>;

    return postss;
  }

  Future<List<Post>> readFromJSON_post() async{
    List<Post> returnFormantPosts=[];

    try{
      final file = await FetchFile("post.json")._localFile;
      String JsonFilecontents = await file.readAsString();
      final list = json.decode(JsonFilecontents) as List<dynamic> ;

      List<PostJsonModel> JsonFormatPostList =[];
      JsonFormatPostList  = list.map((e) => PostJsonModel.fromJson(e)).toList() as List<PostJsonModel>;

      //convert the JSON format User to Actual User and create the return list
      JsonFormatPostList.forEach((element) {
        Post post = Post.Complete(element.id, element.postId, element.userName!, element.ownerId!, element.location!, element.timestamp!, element.mediaUrl!,element.description);
        returnFormantPosts.add(post);
      });

      return returnFormantPosts;
    }
    catch(e)
    {
      print(e);
      return returnFormantPosts;
    }
  }

}

class FetchFile{
  final String filename ;
  FetchFile(this.filename);

  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }
  Future<File> get _localFile async{
    final path = await _localpath;
    // print(path.toString());
    // print("myPath");
    return File("$path/$filename");
  }

}
