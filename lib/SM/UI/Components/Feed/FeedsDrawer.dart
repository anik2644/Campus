import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
/*
          AuthService.is_login ?  UserAccountsDrawerHeader(

            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              AuthService.name,
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(AuthService.email,
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              // backgroundColor: Colors.black,

              backgroundImage: NetworkImage(AuthService.Profilepicurl.toString(), ),
            ),
          ):
           */

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
            leading: Icon(Icons.contacts, color: Colors.white),
            title:
            Text("Contact Us", style: TextStyle(color: Colors.white)),
            onTap: () {
             // Navigator.push(context,MaterialPageRoute(builder: (context) =>MessagesScreen(),));
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
             // Navigator.push(context,MaterialPageRoute(builder: (context) =>hotel_description()));
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