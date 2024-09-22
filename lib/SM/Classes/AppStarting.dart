import 'package:dhabiansomachar/SM/JSON_Management/JSONOFFICE.dart';

import '../JSON_Management/Auth/LoginFlagJson.dart';


class AppStarting{

  Future<void> handleFirstTimeCheck() async {
    JsonOffice jsonOffice = JsonOffice();

    if (await _isFirstTime()) {
      jsonOffice.createFirstTimeFiles();
    }
  }





  Future<bool> _isFirstTime() async {
    JsonOffice jsonOffice = JsonOffice();
    return !(await jsonOffice.fileExist("loginFlag.json"));
  }
}