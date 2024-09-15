import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'ClubDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ClubListHomePage extends StatefulWidget {
  @override
  _ClubListHomePageState createState() => _ClubListHomePageState();
}

class _ClubListHomePageState extends State<ClubListHomePage> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[

    ClubListPage(),
    Text(
      'Explore Page',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile Page',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

/*
      AppBar(
        backgroundColor: Colors.deepPurple,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white60),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),

      */

      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All Clubs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(160.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: CachedNetworkImage(
        imageUrl: 'https://live.staticflickr.com/3788/11189480813_a84dec1c5d_b.jpg', // Replace with your image URL
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DU Listed Clubs',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueAccent.withOpacity(0.5),
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black54,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
            Text(
              'University of Dhaka',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueAccent.withOpacity(0.5),
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black54,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.notifications, size: 30),
        //   onPressed: () {
        //     // Add notification functionality here
        //   },
        // ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(76.0), // Adjust this height if needed
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Clubs',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  // suffixIcon: Icon(Icons.filter_alt, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


class DesignAwardCard extends StatefulWidget {
  final Club club;

  DesignAwardCard({required this.club});

  @override
  State<DesignAwardCard> createState() => _DesignAwardCardState();
}

class _DesignAwardCardState extends State<DesignAwardCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => ClubDetails(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(widget.club.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.club.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Colors.grey[600],
                          size: 16.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          '${widget.club.establishedYear}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey[600],
                          size: 16.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "University Of Dhaka",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: toggleFavorite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




//
// class ClubCard extends StatelessWidget {
//   final Club club;
//
//   const ClubCard({required this.club});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(
//           context,
//           CupertinoPageRoute(
//             builder: (_) => ClubDetails(),
//           ),
//         );
//       },
//       child: Card(
//         margin: EdgeInsets.all(10.0),
//         elevation: 5.0,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 30.0,
//                 backgroundImage: CachedNetworkImageProvider(club.imageUrl),
//               ),
//               SizedBox(width: 10.0),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       club.name,
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple,
//                       ),
//                     ),
//                     SizedBox(height: 5.0),
//                     Text(
//                       'Est: ${club.establishedYear}',
//                       style: TextStyle(
//                         fontSize: 14.0,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//


class ClubListPage extends StatelessWidget {
  final List<Club> clubs = [
    Club(
      name: 'Dhaka University Debating society',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKWxAmTc32pHxAt3WL3J6bsywJ-NrYOaWSfA&s',
      establishedYear: 1990,
    ),
    Club(
      name: 'Slogan Ekattor',
      imageUrl: 'https://www.bssnews.net/assets/news_photos/2023/09/25/image-149204-1695636198.jpg',
      establishedYear: 2000,
    ),
    Club(
      name: 'DUTS',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF74ZQEudcOnn0lFLmLyoXHh5aIKNPJAjOEA&s',
      establishedYear: 1985,
    ),
    Club(
      name: 'Dhaka University Debating society',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKWxAmTc32pHxAt3WL3J6bsywJ-NrYOaWSfA&s',
      establishedYear: 1990,
    ),
    Club(
      name: 'Slogan Ekattor',
      imageUrl: 'https://www.bssnews.net/assets/news_photos/2023/09/25/image-149204-1695636198.jpg',
      establishedYear: 2000,
    ),
    Club(
      name: 'DUTS',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF74ZQEudcOnn0lFLmLyoXHh5aIKNPJAjOEA&s',
      establishedYear: 1985,
    ),
    Club(
      name: 'Dhaka University Debating society',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKWxAmTc32pHxAt3WL3J6bsywJ-NrYOaWSfA&s',
      establishedYear: 1990,
    ),
    Club(
      name: 'Slogan Ekattor',
      imageUrl: 'https://www.bssnews.net/assets/news_photos/2023/09/25/image-149204-1695636198.jpg',
      establishedYear: 2000,
    ),
    Club(
      name: 'DUTS',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF74ZQEudcOnn0lFLmLyoXHh5aIKNPJAjOEA&s',
      establishedYear: 1985,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        return DesignAwardCard(club: clubs[index]);
      },
    );
  }
}

class Club {
  final String name;
  final String imageUrl;
  final int establishedYear;

  Club({
    required this.name,
    required this.imageUrl,
    required this.establishedYear,
  });
}

