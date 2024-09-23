import 'package:dhabiansomachar/SM/JSON_Management/JSONOFFICE.dart';

import '../JSON_Management/Auth/LoginFlagJson.dart';


class AppStart{
  JsonOffice jsonOffice = JsonOffice();

  Future<void> firstTimeCheckCreateJSON() async {
    if (await _isFirstTime()) {
      jsonOffice.createFirstTimeFiles();
    }


  }





  Future<bool> _isFirstTime() async {
    return !(await jsonOffice.fileExist("loginFlag.json"));
  }
}