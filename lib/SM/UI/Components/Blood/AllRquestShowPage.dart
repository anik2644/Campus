import 'package:flutter/material.dart';




class DonationRequestPage extends StatefulWidget {
  @override
  _DonationRequestPageState createState() => _DonationRequestPageState();
}

class _DonationRequestPageState extends State<DonationRequestPage> {
  bool showFilters = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Request'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

            Navigator.pop(context);
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              setState(() {
                showFilters = !showFilters;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            if (showFilters) ...[
              SizedBox(height: 16.0),
              BloodTypeFilter(),
              DepartmentAndHallFilter(),
            ],
            Expanded(
              child: ListView(
                children: [
                  DonationRequestCard(
                    name: 'Irfan Hasan',
                    location: 'Square Hospital',
                    timeAgo: '45 Min Ago',
                    bloodType: 'B+',
                  ),
                  DonationRequestCard(
                    name: 'Ertugrul Gazi',
                    location: 'Popular Hospital',
                    timeAgo: '59 Min Ago',
                    bloodType: 'B+',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: 'Monitor',
          ),
        ],
      ),
    );
  }
}

class BloodTypeFilter extends StatelessWidget {
  final List<String> bloodTypes = [
    'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: bloodTypes
          .map((type) => FilterChip(
        label: Text(type),
        selected: type == 'B+',
        onSelected: (selected) {
          // Handle filter chip selection
        },
      ))
          .toList(),
    );
  }
}

class DepartmentAndHallFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Department'),
          items: ['CSE', 'EEE', 'BBA', 'LAW']
              .map((dept) => DropdownMenuItem<String>(
            value: dept,
            child: Text(dept),
          ))
              .toList(),
          onChanged: (value) {
            // Handle department selection
          },
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Hall'),
          items: ['A', 'B', 'C', 'D']
              .map((hall) => DropdownMenuItem<String>(
            value: hall,
            child: Text(hall),
          ))
              .toList(),
          onChanged: (value) {
            // Handle hall selection
          },
        ),
      ],
    );
  }
}

class DonationRequestCard extends StatelessWidget {
  final String name;
  final String location;
  final String timeAgo;
  final String bloodType;

  DonationRequestCard({
    required this.name,
    required this.location,
    required this.timeAgo,
    required this.bloodType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(location),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bloodtype,
              color: Colors.red,
            ),
            Text(bloodType),
          ],
        ),
        onTap: () {
          // Handle donation button press
        },
      ),
    );
  }
}

//
// class DonationRequestPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Donation Request'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_list),
//             onPressed: () {
//               // Handle filter button press
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'Search',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 fillColor: Colors.grey[200],
//                 filled: true,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             BloodTypeFilter(),
//             Expanded(
//               child: ListView(
//                 children: [
//                   DonationRequestCard(
//                     name: 'Irfan Hasan',
//                     location: 'Square Hospital',
//                     timeAgo: '45 Min Ago',
//                     bloodType: 'B+',
//                   ),
//                   DonationRequestCard(
//                     name: 'Ertugrul Gazi',
//                     location: 'Popular Hospital',
//                     timeAgo: '59 Min Ago',
//                     bloodType: 'B+',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bloodtype),
//             label: 'Requests',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.monitor_heart),
//             label: 'Monitor',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BloodTypeFilter extends StatelessWidget {
//   final List<String> bloodTypes = [
//     'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8.0,
//       children: bloodTypes
//           .map((type) => FilterChip(
//         label: Text(type),
//         selected: type == 'B+',
//         onSelected: (selected) {
//           // Handle filter chip selection
//         },
//       ))
//           .toList(),
//     );
//   }
// }
//
// class DonationRequestCard extends StatelessWidget {
//   final String name;
//   final String location;
//   final String timeAgo;
//   final String bloodType;
//
//   DonationRequestCard({
//     required this.name,
//     required this.location,
//     required this.timeAgo,
//     required this.bloodType,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(name),
//         subtitle: Text(location),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.bloodtype,
//               color: Colors.red,
//             ),
//             Text(bloodType),
//           ],
//         ),
//         onTap: () {
//           // Handle donation button press
//         },
//       ),
//     );
//   }
// }
//
//
//





