import 'package:flutter/material.dart';


class ExecutiveCommitteePage extends StatelessWidget {
  final List<ExecutiveMember> members = [
    ExecutiveMember(
      name: 'Dr. Sanjeeb Shrestha',
      position: 'President',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    ExecutiveMember(
      name: 'Dr. Sharmila Shrestha',
      position: 'Vice-President',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    ExecutiveMember(
      name: 'Dr. Dipesh Bista',
      position: 'Treasurer',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    ExecutiveMember(
      name: 'Dr. Puja Sainju',
      position: 'Director, Communications And CME',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    ExecutiveMember(
      name: 'Dr. Jharana Shrestha',
      position: 'Executive Director',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    ExecutiveMember(
      name: 'Dr. Bishnu Sapkota',
      position: 'Executive Director',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Executive Committee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            return ExecutiveMemberCard(member: members[index]);
          },
        ),
      ),
    );
  }
}

class ExecutiveMember {
  final String name;
  final String position;
  final String imageUrl;

  ExecutiveMember({
    required this.name,
    required this.position,
    required this.imageUrl,
  });
}

class ExecutiveMemberCard extends StatelessWidget {
  final ExecutiveMember member;

  const ExecutiveMemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(member.imageUrl),
        ),
        SizedBox(height: 8.0),
        Text(
          member.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          member.position,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
