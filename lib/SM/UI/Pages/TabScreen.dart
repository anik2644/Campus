import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'Contents.dart';
import 'Feeds.dart';
import 'NewPost.dart';

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
      'title': 'unsee',
      'icon': Ionicons.add_circle,
      'page': Text("hello"),//NewPost(),//AddPost(),
      'index': 1,
    },
    {
      'title': 'Content',
      'icon': Icons.newspaper,
      'page': Contents(),
      'index': 2,
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabScreen()));
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
/*                item['index'] == 1
                    ? AddPost()
                    :*/
                Padding(
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

  AddPost() {
    return Container(
      height: 45.0,
      width: 45.0,
      // ignore: missing_required_param
      child: NewPost(
        icon: Ionicons.add_circle,
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
