import 'package:dhabiansomachar/SM/HP/HomePage/HomePage.dart';
import 'package:dhabiansomachar/SM/UI/Pages/SearchUser.dart';
import 'package:dhabiansomachar/SM/UI/Pages/Settings.dart';
import 'package:dhabiansomachar/SM/Utilites/Helper/Singleton/UserList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../../../ModelClass/LoginFlag.dart';
import '../../../ModelClass/User.dart';
import '../../../Utilites/Constants/firebase.dart';
import '../../Helper/HPStrategy.dart';
import '../../Pages/Chat.dart';
import '../../Pages/Landing.dart';
import '../../Pages/profile.dart';

class FeedsDrawer extends StatefulWidget {
  const FeedsDrawer({Key? key}) : super(key: key);

  @override
  State<FeedsDrawer> createState() => _FeedsDrawerState();
}

class _FeedsDrawerState extends State<FeedsDrawer> {



  @override
  Widget build(BuildContext context) {
    return   Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          LoginCredentials().isLoggedIn() ?  UserAccountsDrawerHeader(

            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              LoginCredentials().loggedInUser!.userName,
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(  LoginCredentials().loggedInUser!.email,
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              // backgroundColor: Colors.black,

              backgroundImage: CachedNetworkImageProvider(LoginCredentials().loggedInUser!.photoUrl!,),






             // NetworkImage(LoginCredentials().loggedInUser!.photoUrl!, ),
            ),
          ):


          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
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

                          Center(

                            child: TextButton(

                              child:Container(child: Text('Login')),
                              onPressed: (){setState(() {

                    /*            Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  AuthService().handleAuthState()),//AccountPage()),
                                );
*/
                              //  AuthService.is_login=true;
                              });}, ),


                          )
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),


          /* ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title:
            Text("Settings", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>SettingsPage()));
            },
          ),  */
          /* ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.white,
            ),
            title: Text(
              "Share",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>SharePage()));
            },
          ),  */




          ListTile(
            leading: Icon(Icons.chat, color: Colors.white),
            title:
            Text("Chat", style: TextStyle(color: Colors.white)),
            onTap: () {

/*              List<User> userss = UserList().getUsers();
              String userIdToRemove = LoginCredentials().loggedInUser!.id; // Replace with the ID you want to remove

              List<User> updatedUserss = List.from(userss); // Create a new list

              updatedUserss.removeWhere((user) => user.id == userIdToRemove);*/

              //Navigator.push(context,MaterialPageRoute(builder: (context) =>Chat()));


                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => Chats(),
                  ),
                );

            },
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.white),
            title:
            Text("Search", style: TextStyle(color: Colors.white)),
            onTap: () {

              List<User> userss = UserList().getUsers();
              String userIdToRemove = LoginCredentials().loggedInUser!.id; // Replace with the ID you want to remove

              List<User> updatedUserss = List.from(userss); // Create a new list

              updatedUserss.removeWhere((user) => user.id == userIdToRemove);

               Navigator.push(context,MaterialPageRoute(builder: (context) =>SearchUser(updatedUserss)));
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts, color: Colors.white),
            title:
            Text("Profile", style: TextStyle(color: Colors.white)),
            onTap: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) =>Profile(user:LoginCredentials().loggedInUser!),));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) =>Setting()));
            },
          ),

          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            onTap: ()  async {
                await firebaseAuth.signOut();

                LoginFlag lf = LoginFlag(false);
                LoginFlagJson lfj = LoginFlagJson();
                 await lfj.saveLoginInfo(lf);
                 print(lf.isloggedin);

                LoginCredentials().logout();

                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => Homepage(),//HPStretegy(), //Landing(),
                  ),
                      (route) => false, // This makes sure that the user can't go back to the previous screen
                );


/*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthService().handleAuthState()),//AccountPage()),
              );*/
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LogoutPage())
              );
               */
            },
          ),

          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // Adjust the position of the shadow
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Back',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
              onTap: () {
                // Handle drawer item tap
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );


    /*  Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              "MHD Mahmud Anik",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text("anik11556@gmail.com",
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                "M",
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    backgroundColor: Colors.grey),
              ),
            ),
          ),
/*
                ListTile(

                  leading: Icon(Icons.home,color: Colors.white,),
                  title: Text("Home",style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                */

          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title:
            Text("Settings", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.white,
            ),
            title: Text(
              "Share",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts, color: Colors.white),
            title:
            Text("Contact Us", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.flag_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Terms & Condition",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );*/
  }
}