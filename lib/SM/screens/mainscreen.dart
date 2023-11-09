import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:social_media_app/HP/HomePage/HomePage.dart';
import 'package:social_media_app/SM/models/user.dart';
import 'package:social_media_app/SM/posts/Content/Model/Content.dart';
// import 'package:social_media_app/components/fab_container.dart';
// import 'package:social_media_app/pages/notification.dart';
// import 'package:social_media_app/pages/profile.dart';
// import 'package:social_media_app/pages/search.dart';
// import 'package:social_media_app/pages/feeds.dart';
// import 'package:social_media_app/utils/firebase.dart';

import '../components/fab_container.dart';
import '../pages/contentFeeds.dart';
import '../pages/feeds.dart';
import '../pages/notification.dart';
import '../pages/profile.dart';
import '../pages/search.dart';
import '../utils/firebase.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _page = 0;

  List pages = [
    {
      'title': 'Home',
      'icon': Ionicons.home,
      'page': Feeds(),
      'index': 0,
    },
    {
      'title': 'Content',
      'icon': Icons.newspaper,
      'page': ContentFeeds(),
      'index': 1,
    },
    {
      'title': 'Search',
      'icon': Ionicons.search,
      'page': Search(),
      'index': 2,
    },
    {
      'title': 'unsee',
      'icon': Ionicons.add_circle,
      'page': Text('nes'),
      'index': 3,
    },
    {
      'title': 'Notification',
      'icon': CupertinoIcons.bell_solid,
      'page': Activities(),
      'index': 4,
    },
    {
      'title': 'Profile',
      'icon': CupertinoIcons.person_fill,
      'page': Profile(profileId: firebaseAuth.currentUser!.uid,email: firebaseAuth.currentUser!.email),
      'index': 5,
    },
  ];

  /*
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: UserModel.UserRefresh(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Scaffold(
            body: PageTransitionSwitcher(
              transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  ) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: pages[_page]['page'],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
                  for (Map item in pages)
                    item['index'] == 2
                        ? buildFab()
                        : Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: IconButton(
                        icon: Icon(
                          item['icon'],
                          color: item['index'] != _page
                              ? Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black
                              : Theme.of(context).colorScheme.secondary,
                          size: 25.0,
                        ),
                        onPressed: () => navigationTapped(item['index']),
                      ),
                    ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          );
        }
      },
    );
  }
 */



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          if(_page==0)
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
            }
          else
            {
            _page =0;
            }
        });
        return null!;
      },
      child: Scaffold(
        body: PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: pages[_page]['page'],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 5),
              for (Map item in pages)
                item['index'] == 3
                    ? buildFab()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: IconButton(
                          icon: Icon(
                            item['icon'],
                            color: item['index'] != _page
                                ? Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black
                                : Theme.of(context).colorScheme.secondary,
                            size: 25.0,
                          ),
                          onPressed: () => navigationTapped(item['index']),
                        ),
                      ),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }

  buildFab() {
    return Container(
      height: 45.0,
      width: 45.0,
      // ignore: missing_required_param
      child: FabContainer(
        icon: Ionicons.add,
        mini: true,
      ),
    );
  }

  void navigationTapped(int page) {
    setState(() {

      _page = page;
    });
  }
}