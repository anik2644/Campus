import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileAppBar extends StatefulWidget {
  const EditProfileAppBar({super.key});

  @override
  State<EditProfileAppBar> createState() => _EditProfileAppBarState();
}

class _EditProfileAppBarState extends State<EditProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("Edit Profile",),
      actions: [
/*
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () async {

                //
                //
                // print(country);
                // print(imgurl);
                // print(bio);
                // print(firebaseAuth.currentUser!.uid);
                // print(firebaseAuth.currentUser!.photoURL);
                //
                //
                //
                // if(bio == "a")
                // {
                //   bio =widget.user?.bio ?? "";
                // }
                // if(imgurl == "a")
                // {
                //   imgurl =widget.user?.photoUrl ?? "";
                // }
                // if(country == "a")
                // {
                //   country =widget.user?.country ?? "";
                // }
                // if(Username == "a")
                // {
                //   Username =widget.user?.userName ?? "";
                // }
                // //CollectionReference collection = FirebaseFirestore.instance.collection('users');
                //
                // CollectionReference collection =
                // FirebaseFirestore.instance.collection('users');
                // DocumentReference document = collection.doc(firebaseAuth.currentUser!.uid);
                //
                // try {
                //   await document.update({
                //
                //     // 'field_name': 'new_value',
                //     'bio': bio,
                //     'country' : country,
                //     'username' : Username,
                //     'photoUrl' : imgurl,
                //
                //
                //   });
                //   print('Field updated successfully.');
                // } catch (e) {
                //   print('Error updating field: $e');
                // }

                Navigator.of(context).pop();
                // viewModel.editProfile(context);
              },
              child: Text(
                'SAVE',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.0,

                  color: Colors.black //Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ),
*/

      ],
    );
  }
}
