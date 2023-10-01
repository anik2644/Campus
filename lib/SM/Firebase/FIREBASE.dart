import 'package:dhabiansomachar/SM/Firebase/FirebaseMethods/FirebaseFetchdata.dart';

class FIREBASE{
  final String collectionName;
  FIREBASE(this.collectionName);

   late FirebaseFetchData ffd =FirebaseFetchData(collectionName) ;

  Future<List<Object>> fetchData() async {
    return await ffd.fetchdata();
  }

}