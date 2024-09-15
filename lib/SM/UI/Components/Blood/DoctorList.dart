import 'package:flutter/material.dart';


class DoctorListPage extends StatefulWidget {
  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.lightGreenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Requests'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'New'),
            Tab(text: 'On Going'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          DoctorList(),
          Center(child: Text('On Going')),
          Center(child: Text('History')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        DoctorCard(
          name: 'Dr. Stefin Rowney',
          roomNo: '121',
          bedNo: '12',
          request: 'Hi, I want some water',
          time: 'Just Now',
          isNew: true,
        ),
        DoctorCard(
          name: 'Dr. John Rowney',
          roomNo: '122',
          bedNo: '12',
          request: 'Hi, I need assistance',
          time: '10:00 AM',
          isNew: false,
        ),
        DoctorCard(
          name: 'Dr. Stefin Rowney',
          roomNo: '121',
          bedNo: '12',
          request: 'Hi, I want some water',
          time: '09:30 AM',
          isNew: true,
        ),
        DoctorCard(
          name: 'Dr. John Rowney',
          roomNo: '122',
          bedNo: '12',
          request: 'Hi, I want some water',
          time: '09:00 AM',
          isNew: false,
        ),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String roomNo;
  final String bedNo;
  final String request;
  final String time;
  final bool isNew;

  DoctorCard({
    required this.name,
    required this.roomNo,
    required this.bedNo,
    required this.request,
    required this.time,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isNew ? Colors.redAccent.withOpacity(0.1) : Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/doctor_avatar.png'), // Placeholder image asset
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Room No: $roomNo    Bed No: $bedNo'),
            Text(request),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time),
            if (isNew)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'New',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
