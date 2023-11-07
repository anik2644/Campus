import 'package:dhabiansomachar/SM/JSON_Management/JSONMethods/JSONMethods.dart';
import 'package:dhabiansomachar/SM/ModelClass/Flags.dart';
import 'package:dhabiansomachar/SM/ModelClass/Post.dart';

import '../ModelClass/Content.dart';
import '../ModelClass/User.dart';

class JSONFile{
  final String jsonFileName;
  JSONMethods jsonMethods = JSONMethods();
  JSONFile(this.jsonFileName);

  Future<List<Object>>  read() async {
    if(jsonFileName=="posts")
      {
        return await jsonMethods.readFromJSON_post() as List<Post>;
      }
    else if(jsonFileName=="users")
    {
      return await jsonMethods.readFromJSON_user() as List<User>;
    }
    else if(jsonFileName=="contents")
    {
      return await jsonMethods.readFromJSON_content() as List<Content>;
    }
    else if(jsonFileName=="flags")
    {
      return await jsonMethods.readFromJSON_flags() as List<Flags>;
    }
    else
      return [];
  }
  void write(List<Object> list)
  {
    if(jsonFileName=="posts")
    {
      jsonMethods.writeToJSON_post(list as List<Post>);
    }
    else if(jsonFileName=="users")
    {
      jsonMethods.writeToJSON_user(list as List<User>);
    }
    else if(jsonFileName=="contents")
    {
      jsonMethods.writeToJSON_content(list as List<Content>);
    }
    else if(jsonFileName=="flags")
    {
      jsonMethods.writeToJSON_flags(list as List<Flags>);
    }
  }


}