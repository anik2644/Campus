import '../../Firebase/Contents/FBContentsOffice.dart';
import '../../JSON_Management/Contents/JSONContentsOffice.dart';
import '../../ModelClass/Content.dart';

class ContentsOffice{

  FBContentsOffice fbContentsOffice = FBContentsOffice();
  JSONContentsOffice jsonContentsOffice = JSONContentsOffice();

  Future<List<Content>> getContents() async {
    List<Content> contents = await _fetchContentsFromJSON();
    if (contents.isEmpty) {

      print("hello i am empty \n\n\n");
      contents = await _fetchContentsFromFB();
      await jsonContentsOffice.writeToJSON_content(contents);
    }
   return contents;
  }


  Future<List<Content>> updateContents() async {
    List<Content> contents =  await _fetchContentsFromFB();
    await jsonContentsOffice.writeToJSON_content(contents);

    return contents;
  }




/*  Future<List<Content>> fetchContentsFromJSON() async {
    return await jsonContentsOffice.readFromJSON_content();
  }*/
  Future<List<Content>> _fetchContentsFromJSON() async {
    return await jsonContentsOffice.readFromJSON_content();
  }


  Future<List<Content>> _fetchContentsFromFB() async {
    return await fbContentsOffice.fetchContent();
  }

}