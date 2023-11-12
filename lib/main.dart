
import 'package:dhabiansomachar/SM/HP/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'SM/Configuration/config.dart';
import 'SM/UI/Components/Common/ImagePickOption.dart';
import 'SM/UI/Helper/HPStrategy.dart';
import 'SM/UI/Pages/Feeds.dart';
import 'SM/Utilites/Providers/Providers.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.initFirebase();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {@override Widget build(BuildContext context) {
  return MultiProvider(
      providers: providers,
      child: MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData(primarySwatch: Colors.blue,), home: const MyHomePage(),)
  );}}



class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return  HPStretegy();//Homepage();//HPStretegy();//Feeds();

  }
}