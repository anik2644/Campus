import 'package:flutter/material.dart';


class LW extends StatefulWidget {
  @override
  _LWState createState() => _LWState();
}

class _LWState extends State<LW> {
  String lan = '';

  void onchaneged(String str)
  {
    lan= detectLanguage(str);
    setState(() {
      lan =lan;
    });
  }



  String detectLanguage(String string) {

    String languageCodes = 'en';

    final RegExp persian = RegExp(r'^[\u0600-\u06FF]+');
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    final RegExp number = RegExp(r'^[0-9]+');
    final RegExp arabic = RegExp(r'^[\u0621-\u064A]+');
    final RegExp chinese = RegExp(r'^[\u4E00-\u9FFF]+');
    final RegExp japanese = RegExp(r'^[\u3040-\u30FF]+');
    final RegExp korean = RegExp(r'^[\uAC00-\uD7AF]+');
    final RegExp ukrainian = RegExp(r'^[\u0400-\u04FF\u0500-\u052F]+');
    final RegExp russian = RegExp(r'^[\u0400-\u04FF]+');
    final RegExp italian = RegExp(r'^[\u00C0-\u017F]+');
    final RegExp french = RegExp(r'^[\u00C0-\u017F]+');
    final RegExp bangla = RegExp(r'^[\u0980-\u09ff]+');
    final RegExp spanish = RegExp(r'[\u00C0-\u024F\u1E00-\u1EFF\u2C60-\u2C7F\uA720-\uA7FF\u1D00-\u1D7F]+');

    if (persian.hasMatch(string)) languageCodes = 'fa';
    if (bangla.hasMatch(string)) languageCodes = 'bangla';
    if (english.hasMatch(string)) languageCodes = 'en';
    if (arabic.hasMatch(string)) languageCodes = 'ar';
    if (chinese.hasMatch(string)) languageCodes = 'zh';
    if (japanese.hasMatch(string)) languageCodes = 'ja';
    if (korean.hasMatch(string)) languageCodes = 'ko';
    if (russian.hasMatch(string)) languageCodes = 'ru';
    if (ukrainian.hasMatch(string)) languageCodes = 'uk';
    if (italian.hasMatch(string)) languageCodes = 'it';
    if (french.hasMatch(string)) languageCodes = 'fr';
    if (spanish.hasMatch(string)) languageCodes = 'es';
    if (number.hasMatch(string)) languageCodes = 'num';



    return languageCodes;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Detection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: onchaneged, //detectedLanguage,// /(){}, //detectLanguageAndSetState,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Detected Language: $lan',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
