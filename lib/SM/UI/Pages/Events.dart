import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../ModelClass/Event.dart';
import '../../ModelClass/LoginCredential.dart';
import '../../ModelClass/User.dart';
import '../../Utilites/Helper/GetWant.dart';
import '../../Utilites/Helper/Singleton/PostList.dart';
import '../../Utilites/Helper/Singleton/UserList.dart';
import '../Components/Event/CreateEvent.dart';


class EventPage extends StatefulWidget {
  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  bool isLoading = true;
  ScrollController scrollController = ScrollController();
  Future<void> takeDataToRam() async {

    if(UserList().isListEmpty()||PostList().isListEmpty())
    {

      UserList().setUsers( await GetWant().getAllUserfromJson());
      PostList().setPosts(await GetWant().getAllPostfromJson());
    }
    setState(() => isLoading =false);
  }
  @override
  void initState() {
    isLoading = true;
    takeDataToRam();
    // fetchData();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {

        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarr() ,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateEventButton(),
                //CreateEvent():
                //CreateEventBox(),
                //HeaderSection(),
                SizedBox(height: 20),
               // SearchBar(),
                SizedBox(height: 20),
                UpcomingEventsSection(),
                SizedBox(height: 20),
                TopPicksSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//
// class CreateEventBox extends StatefulWidget {
//   @override
//   _CreateEventBoxState createState() => _CreateEventBoxState();
// }
//
// class _CreateEventBoxState extends State<CreateEventBox> {
//   bool isDescriptionVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: ExpansionTile(
//         title: Text('Create New Event'),
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//           ),
//           if (isDescriptionVisible)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Description',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 maxLines: null,
//                 keyboardType: TextInputType.multiline,
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // Add location selection functionality here
//                     },
//                     icon: Icon(Icons.location_on),
//                     label: Text('Location'),
//                   ),
//                   SizedBox(width: 16.0),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // Add date & time selection functionality here
//                     },
//                     icon: Icon(Icons.calendar_today),
//                     label: Text('Time & Date'),
//                   ),
//                   SizedBox(width: 16.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isDescriptionVisible = !isDescriptionVisible;
//                       });
//                     },
//                     child: Text(isDescriptionVisible ? 'Hide Description' : 'Add Description'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class CreateEventButton extends StatelessWidget {

  User user = LoginCredentials().loggedInUser!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => CreateEvent(),
          ),
        );

      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:CachedNetworkImageProvider(
                 // "https://cdn3d.iconscout.com/3d/premium/thumb/boy-9251893-7590885.png?f=webp"
                  user!.photoUrl!
                //user.photoUrl!.isEmpty}',
              ), // Your image asset here
            ),
            SizedBox(width: 10),
            Container(
              child: Text( "একটি নতুন ইভেন্ট তৈরি করুন "),
            ),
            SizedBox(width: 30),
            // Expanded(
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: "What's on your mind? \nCreate your own Event"
            //       ,
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            Icon(
              Icons.image,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

//
// class CustomAppBar extends StatelessWidget {
//   @override
//   Size get preferredSize => Size.fromHeight(160.0);
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       pinned: true,
//       floating: true,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFEC407A), Color(0xFF8E24AA)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//       ),
//       title: Padding(
//         padding: const EdgeInsets.only(top: 18.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Events near me',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white70,
//               ),
//             ),
//             Text(
//               'HELLO',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.notifications, size: 30),
//           onPressed: () {
//             // Add notification functionality here
//           },
//         ),
//       ],
//       bottom: PreferredSize(
//         preferredSize: Size.fromHeight(76.0),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search events',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   suffixIcon: Icon(Icons.filter_alt, color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomAppBarr extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(160.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2196F3), // Light Blue
              Color(0xFF0D47A1), // Dark Blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ঢাকা বিশ্ববিদ্যালয়',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            Row(
              children: [
                // Add the logo image from the assets folder
                // Image.asset(
                //   'assets/logo/DU-logo.png',  // Replace with your image path
                //   width: 40,          // Adjust the width as needed
                //   height: 40,         // Adjust the height as needed
                // ),
                // SizedBox(width: 10),  // Add some spacing between the image and text
                // // Add the text
                Text(
                  'দারুন সব ইভেন্ট গুলো',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, size: 30),
          onPressed: () {
            // Add notification functionality here
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(76.0),  // Adjust this height if needed
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'পছন্দের কোনো ইভেন্ট খুঁজে দেখুন',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: Icon(Icons.filter_alt, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
//
// class HeaderSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Events near me',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//             Text(
//               'ঢাকা বিশ্ববিদ্যালয়, USA',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         Icon(Icons.notifications, size: 30, color: Colors.grey[600]),
//       ],
//     );
//   }
// }

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search events',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.filter_alt),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class TopPicksSection extends StatelessWidget {
  // List of Event objects
  final List<Event> eventList = [
    Event(
      title: 'Comedy Gala Night at The Club',
      imagePath: 'assets/Event/bstno.png',
      location: 'California, USA',
      dateTime: '17 Mar, 2023',
    ),
    Event(
      title: 'Rock Music Festival',
      imagePath: 'assets/Event/pithaUtshob.jpg',
      location: 'Los Angeles, USA',
      dateTime: '20 Apr, 2023',
    ),
    Event(
      title: 'Tech Expo 2023',
      imagePath: 'assets/Event/Pohela-Boishakh.jpg',
      location: 'New York, USA',
      dateTime: '12 May, 2023',
    ),
    Event(
      title: 'Art Exhibition',
      imagePath: 'assets/Event/sadhinota.png',
      location: 'Paris, France',
      dateTime: '03 Jun, 2023',
    ),
    Event(
      title: 'Food Fair',
      imagePath: 'assets/Event/usthiob.jpg',
      location: 'Chicago, USA',
      dateTime: '18 Jul, 2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'অগ্রাধিকার পছন্দ 🔥', showViewAll: true),
        SizedBox(height: 10),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              final event = eventList[index];
              return LargeEventCard(
                title: event.title,
                image: AssetImage(event.imagePath), // Use AssetImage for local images
                location: event.location,
                dateTime: event.dateTime,
              );
            },
          ),
        ),
        SizedBox(height: 10),
        EventCategoryFilter(),
      ],
    );
  }
}



/*

class TopPicksSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Top Picks 🔥', showViewAll: true),
        SizedBox(height: 10),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return LargeEventCard(
                title: 'Comedy Gala Night at The Club',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrNHpKTnMzxLZ6ZCShzOZkU-nl1_LxhQZlug&s',
                location: 'California, USA',
                dateTime: '17 Mar, 2023',
              );
            },
          ),
        ),
        SizedBox(height: 10),
        EventCategoryFilter(),
      ],
    );
  }
}
*/
class UpcomingEventsSection extends StatelessWidget {

  // Create a list of events with asset images
  List<Event> eventList_upcomming = [
    Event(
      title: 'Summer Music Festival 2023',
      imagePath: 'assets/Event/banglaband.jpg',
      location: 'California, USA',
      dateTime: '17 Mar, 2023',
    ),
    Event(
      title: 'Autumn Art Show',
      imagePath: 'assets/Event/boisakh.jpg',
      location: 'New York, USA',
      dateTime: '21 Sep, 2023',
    ),
    Event(
      title: 'Winter Tech Expo',
      imagePath: 'assets/Event/nobanno.jpg',
      location: 'San Francisco, USA',
      dateTime: '05 Dec, 2023',
    ),
    Event(
      title: 'Spring Food Fair',
      imagePath: 'assets/Event/iftar.jpg',
      location: 'Chicago, USA',
      dateTime: '15 Apr, 2023',
    ),
    Event(
      title: 'International Film Festival',
      imagePath: 'assets/Event/boshonto.png',
      location: 'Los Angeles, USA',
      dateTime: '12 Jul, 2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'আসন্ন অনুষ্ঠানসমূহ'),
        SizedBox(height: 10),
        Container(
          height: 120,
          child:
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: eventList_upcomming.length,
            itemBuilder: (context, index) {
              final event = eventList_upcomming[index];
              return EventCard(
                  title: event.title,
                  imageUrl: AssetImage(event.imagePath), // Use AssetImage here
                  location: event.location,
                  dateTime: event.dateTime,
              );
            },
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showViewAll;

  const SectionHeader({
    Key? key,
    required this.title,
    this.showViewAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (showViewAll)
          Text(
            'View All',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final ImageProvider imageUrl; // Change it to ImageProvider
  final String location;
  final String dateTime;

  const EventCard({
    Key? key,
    required this.title,
    required this.imageUrl, // Accept ImageProvider here
    required this.location,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          // Display image using the Image widget and pass the ImageProvider
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              image: imageUrl, // Use ImageProvider here
              fit: BoxFit.cover,
              width: 200,
              height: 300,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.7],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// class EventCard extends StatelessWidget  {
//   final String title;
//   final String imageUrl;
//   final String location;
//   final String dateTime;
//
//   const EventCard({
//     Key? key,
//     required this.title,
//     required this.imageUrl,
//     required this.location,
//     required this.dateTime,
//   }) : super(key: key);
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       margin: EdgeInsets.only(right: 16),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(16.0),
//             child: CachedNetworkImage(
//               imageUrl: imageUrl,
//               placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//               errorWidget: (context, url, error) => Icon(Icons.error),
//               fit: BoxFit.cover,
//               width: 200,
//               height: 120,
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//               gradient: LinearGradient(
//                 colors: [Colors.black.withOpacity(0.6), Colors.transparent],
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 stops: [0, 0.7],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 8,
//             left: 8,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   dateTime,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Text(
//                   location,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
/*
class LargeEventCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String location;
  final String dateTime;

  const LargeEventCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              width: 300,
              height: 200,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.7],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

// }


class LargeEventCard extends StatelessWidget {
  final String title;
  final ImageProvider image;  // Change to ImageProvider to accept both asset and network images
  final String location;
  final String dateTime;

  const LargeEventCard({
    Key? key,
    required this.title,
    required this.image,  // Accept ImageProvider
    required this.location,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              image: image,  // Use Image widget and ImageProvider here
              fit: BoxFit.cover,
              width: 300,
              height: 200,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.7],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class EventCategoryFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterChip(label: Text('All'), onSelected: (bool value) {}),
        FilterChip(label: Text('Concert'), onSelected: (bool value) {}),
        FilterChip(label: Text('Book'), onSelected: (bool value) {}),
        FilterChip(label: Text('Party'), onSelected: (bool value) {}),
      ],
    );
  }
}





