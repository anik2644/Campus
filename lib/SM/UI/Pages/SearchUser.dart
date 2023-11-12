import 'package:dhabiansomachar/SM/UI/Pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../ModelClass/User.dart';

class SearchUser extends StatefulWidget {
  final List<User> userList;

  SearchUser(this.userList);

  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  List<User> filteredList = [];
  String avatar =
      "https://i.pinimg.com/originals/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg";

  @override
  void initState() {
    super.initState();
    filteredList = List.from(widget.userList);
  }

  void filterUsers(String query) {
    setState(() {
      filteredList = widget.userList
          .where((user) =>
      user.userName.toLowerCase().contains(query.toLowerCase()) ||
          user.email.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0,bottom: 8.0,top: 6.0), // Adjust padding as needed
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 56.0, // Full width minus space for back button
              child: TextField(
                onChanged: filterUsers,
                style: TextStyle(color: Colors.white), // Text color
                decoration: InputDecoration(
                  hintText: 'Search for users...',
                  hintStyle: TextStyle(color: Colors.white54), // Hint text color
                  prefixIcon: Icon(Icons.search, color: Colors.white), // Search icon color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Border color when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Border color when focused
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: filteredList[index].photoUrl == null ||
                  filteredList[index].photoUrl!.isEmpty
                  ? CachedNetworkImageProvider(avatar)
                  : CachedNetworkImageProvider(filteredList[index].photoUrl!),
            ),
            title: Text(filteredList[index].userName ?? ''),
            subtitle: Text(filteredList[index].email ?? ''),
            onTap: () {

              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (_) => Profile(user: filteredList[index],),
                ),
              );
              // Handle tapping on the user
              print('Tapped on ${filteredList[index].userName}');
            },
          );
        },
      ),
    );
  }
}
