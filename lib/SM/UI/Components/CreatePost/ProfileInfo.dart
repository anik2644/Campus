import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../../../ModelClass/User.dart';
import '../../../Utilites/Constants/firebase.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.0),
        StreamBuilder(
          stream: usersRef.doc(LoginCredentials().loggedInUser!.id).snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              User user = LoginCredentials().loggedInUser!;
              /*UserModel.fromJson(
                      snapshot.data!.data() as Map<String, dynamic>,
                    );*/
              return ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(user.photoUrl!),
                ),
                title: Text(
                  user.userName!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  user.email!,
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
