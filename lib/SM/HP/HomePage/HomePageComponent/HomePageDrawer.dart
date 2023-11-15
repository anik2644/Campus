// import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageDrawerElement/AllSIdeBarItems/AboutUs.dart';
// import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageDrawerElement/AllSIdeBarItems/UserManual.dart';
// import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageDrawerElement/AllSIdeBarItems/umanualNafisa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import '../../ParticularHP/PHPComponents/ParticularDetails/PHPSffold/ScaffoldItems/BodyComponents/Chat/MessageScreen.dart';
import '../../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../../UI/Helper/HPStrategy.dart';
import 'HomepageDrawerElement/AllSIdeBarItems/AboutUs.dart';
import 'HomepageDrawerElement/AllSIdeBarItems/campousia.dart';
import 'HomepageDrawerElement/AllSIdeBarItems/umanualNafisa.dart';
import 'HomepageDrawerElement/LoginPopup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class Mydrawer extends StatefulWidget {

  int index =5;

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {



  bool firstTime = true;
  bool isloggedin = false;

  alreadyLoggedin()
  async {

    firstTime = await  _firstTime();
    if(firstTime==false)
      {
        isloggedin = (await LoginFlagJson().getLoginInfo()).isloggedin;
        setState(() {

        });
      }

  }
   @override
  void initState() {

     alreadyLoggedin();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(image: CachedNetworkImageProvider("https://live.staticflickr.com/3788/11189480813_a84dec1c5d_b.jpg")),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Container(child: Text(' ')),
                          Container(child: Text(' ')),
                          Container(),


                         isloggedin?
                         Center (
                           child: ElevatedButton(

                             child:Container(child: Text('Go Dude!')),
                             onPressed: (){

                               setState(() {
                                 Navigator.push(context,
                                     MaterialPageRoute(builder: (context) =>HPStretegy()// Landing(),//SecondaryHomepage()
                                     ));
                               });


/*
                                LoginPopup popup = LoginPopup(context, widget.index);
                                popup.openDialouge(widget.index);
*/


                             }, ),
                         ):
                         Center (
                            child: ElevatedButton(

                              child:Container(child: Text('Login')),
                              onPressed: (){

                                setState(() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>HPStretegy()// Landing(),//SecondaryHomepage()
                                      ));
                                });


/*
                                LoginPopup popup = LoginPopup(context, widget.index);
                                popup.openDialouge(widget.index);
*/


                              }, ),
                          ),
/*
                          Center(
                            child: Row(
                              children: [
                                OutlinedButton(
                                  child:Container(child: Text('Login')),
                                  onPressed: (){

                                    setState(() {
                            //      Navigator.push(context, MaterialPageRoute(builder: (context) =>  AuthService().handleAuthState()),//AccountPage()),);
                                  });}, ),
                                SizedBox(width: 20,),
                                OutlinedButton(
                                  child:Container(child: Text('Sign Up')),
                                  onPressed: (){

                                    setState(() {
                                      //      Navigator.push(context, MaterialPageRoute(builder: (context) =>  AuthService().handleAuthState()),//AccountPage()),);
                                    });}, ),
                              ],
                            ),
                          )

                          */
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),


          ListTile(
            leading: Icon(Icons.book_outlined, color: Colors.white),
            title:
            Text("User MAnual", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>UserManuall(),));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_mark, color: Colors.white),
            title:
            Text("Campousia", style: TextStyle(color: Colors.white)),
            onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>campousia(),));
            },
          ),
          ListTile(
            leading: Icon(Icons.message, color: Colors.white),
            title:
            Text("Feedback", style: TextStyle(color: Colors.white)),
            onTap: () {
              //Navigator.push(context,MaterialPageRoute(builder: (context) =>MessagesScreen(),));
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title:
            Text("About Us", style: TextStyle(color: Colors.white)),
            onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>AboutUs(),));
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.flag_rounded,
          //     color: Colors.white,
          //   ),
          //   title: Text(
          //     "Terms & Condition",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //    // Navigator.push(context,MaterialPageRoute(builder: (context) =>hotel_description()));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.logout,
          //     color: Colors.white,
          //   ),
          //   title: Text(
          //     "Logout",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //
          //  //   Navigator.push(context,MaterialPageRoute(builder: (context) => AuthService().handleAuthState()),//AccountPage()),);
          //
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.contacts, color: Colors.white),
          //   title:
          //   Text("Contact Us", style: TextStyle(color: Colors.white)),
          //   onTap: () {
          //     //  Navigator.push(context,MaterialPageRoute(builder: (context) =>MessagesScreen(),));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.flag_rounded,
          //     color: Colors.white,
          //   ),
          //   title: Text(
          //     "Terms & Condition",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //     // Navigator.push(context,MaterialPageRoute(builder: (context) =>hotel_description()));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.logout,
          //     color: Colors.white,
          //   ),
          //   title: Text(
          //     "Logout",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //
          //     //   Navigator.push(context,MaterialPageRoute(builder: (context) => AuthService().handleAuthState()),//AccountPage()),);
          //
          //   },
          // ),
        ],
      ),
    );

  }


  Future<File> _findFile(String filename) async {
    final path = await _localPatgh;
    return File("$path/$filename");
  }


  Future<bool> _doesFileExist(String filename) async {
    File file = await _findFile(filename);
    return file.exists();
  }

  Future<bool> _firstTime() async {
    String fname = "loginFlag.json";
    bool fileExists = await _doesFileExist(fname);
    if (fileExists) {
      return false;
    } else {
      return true;
    }
  }


  Future<String> get _localPatgh async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path ;
  }

}
