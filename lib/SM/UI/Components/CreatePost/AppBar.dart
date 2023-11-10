import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
class CreatAppBar extends StatefulWidget {
  const CreatAppBar({super.key});

  @override
  State<CreatAppBar> createState() => _CreatAppBarState();
}

class _CreatAppBarState extends State<CreatAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Ionicons.close_outline),
        onPressed: () {
          // viewModel.resetPost();
          Navigator.pop(context);
        },
      ),
      title: Text('Create Post'.toUpperCase()),
      centerTitle: true,
      actions: [

        IconButton(
            onPressed: () async {


              //rint(loc);
              print("Post Clicked");

            },
            icon: Icon(Icons.send))

        /*


          GestureDetector(
            onTap: () async {

              String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

            //  Reference referenceRoot = FirebaseStorage.instance.ref();
              //   Reference referenceDirImages = referenceRoot.child('images');

              // Reference referenceImageToUpload =
              // referenceDirImages.child(uniqueFileName);

/*

              try {
                //Store the file
                await referenceImageToUpload.putFile(File(pathh));
                //Success: get the download URL
                imgurl = await referenceImageToUpload.getDownloadURL();

                print("Img URL:" +imgurl);
              } catch (error) {
                //Some error occurred
              }
*/
             QuerySnapshot querySnapshot = await postRef.get();
                int collectionLength = querySnapshot.size;
              DateTime now = DateTime.now();
              String formattedDateTime = DateFormat('EEEE, MMMM d, \nHH:mm, yyyy' ).format(now);
              post =Post.Complete("vugichugi", collectionLength,thisUser.userName, thisUser.id, loc, formattedDateTime, imgurl, des, thisUser.email, thisUser.photoUrl);

              /*

               Post posst = SendToFbase().sendPost(post);
               PostList().addPost(posst);


               */
              print(">>");
              Navigator.pop(context);
              //_currentTime;
              //  await viewModel.uploadPosts(context);
              // viewModel.resetPost();
            },
            child: Text(
              'Post'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )


           */

      ],
    );
  }
}
