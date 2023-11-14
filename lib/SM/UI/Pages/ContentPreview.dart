import 'package:dhabiansomachar/SM/UI/Components/ContentPreview/AppBar.dart';
import 'package:dhabiansomachar/SM/UI/Widgets/indicators.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentPreview extends StatefulWidget {
  final List<String> InputImagesSequence; // = [];
  final List<String> ContentImageSequence; // = [];
  final List<String> ContentSegments;

  final String location;
  final String title;

  const ContentPreview(
      {required this.InputImagesSequence,
      required this.ContentImageSequence,
      required this.ContentSegments,
      required this.location,
      required this.title}); // = [];

  @override
  _ContentPreviewState createState() => _ContentPreviewState();
}

class _ContentPreviewState extends State<ContentPreview> {
  List<String> AllImagesList = [];
  String imgurl = "";
  bool isloading = false;
  Future<void> AddThisContentToFireStore() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('Contents');

    try {
      await collection.doc(widget.title).set({
        'Title': widget.title,
        'AllImagesList': AllImagesList,
        'ContentImageSequence': widget.ContentImageSequence,
        'ContentSegments': widget.ContentSegments,
        'Location': widget.location,
      });
      print(
          'String array added to Firestore collection with document ID successfully.');
    } catch (e) {
      print('Error adding string array to Firestore collection: $e');
    }
  }

  Future<void> SentAllImageTOFireStorage() async {
    AllImagesList.clear();
    for (int i = 0; i < widget.InputImagesSequence.length; i++) {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      String temp = widget.title;
      String imgName = '$temp$i';

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('contents');
      Reference referenceImageToUpload = referenceDirImages.child(imgName);

      try {
        //Store the file
        await referenceImageToUpload
            .putFile(File(widget.InputImagesSequence[i]));
        //Success: get the download URL
        imgurl = await referenceImageToUpload.getDownloadURL();

        print("Img URL:" + imgurl);
        AllImagesList.add(imgurl);
      } catch (error) {}
    }

    print("loop done");
    print(AllImagesList.toString());
    AddThisContentToFireStore();
  }

  List<Widget> ImaList = [];

  Future<void> test() async {
    print('Dropped items:');
    print(widget.ContentImageSequence);
    print('Images Numbers:');
    print(widget.InputImagesSequence);
    print("Content portions :");
    for (int i = 0; i < widget.ContentSegments.length; i++) {
      print(widget.ContentSegments[i]);
      print("i = $i ");
    }
  }

  Widget ImageContainer(int i) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child: Image.file(
        File(widget.InputImagesSequence[i]),
        //File(widget.InputImagesSequence[i]),
        //int.parse(widget.InputImagesSequence[index ~/3])
        // width: 50,
        // height: 50,
        //  fit: BoxFit.cover,
      ),
    );
  }

  void ImgListCreator() {
    for (int i = 0; i < widget.InputImagesSequence.length; i++) {
      ImaList.add(ImageContainer(i));
    }
  }

  @override
  void initState() {


    ImgListCreator();
    // TODO: implement initState
    super.initState();
  }

  // Future<void> pickImages() async {
  //
  //   print(bengaliPoemList.length);
  //   print("list size");
  //   List<XFile>? images = await ImagePicker().pickMultiImage();
  //   if (images != null) {
  //     setState(() {
  //       selectedImages = images.map((image) => image.path).toList();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ContentAppBAr(
            onLoading: (bool isload) {

              setState(() {
                isloading = isload;
              });

              print('getting the path: $isload');
            },
            InputImagesSequence: widget.InputImagesSequence, ContentImageSequence:widget.ContentImageSequence, ContentSegments: widget.ContentSegments, location: widget.location, title: widget.title,)),
      body: isloading? circularProgress(context):
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.book, // Replace with your desired icon
                        color: Colors.black87,
                        size: 40,
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                  // SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on, // Replace with your desired icon
                          color: Colors.black87,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.location,
                          style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListView.builder(
                  itemCount: widget.ContentSegments.length + 2,
                  itemBuilder: (context, index) {
                    return index == widget.ContentSegments.length
                        ? SizedBox(
                            height: 30,
                          )
                        : index == widget.ContentSegments.length + 1
                            ? CarouselSlider(
                                items: ImaList,
                                options: CarouselOptions(
                                  height: 300.0,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 600),
                                  viewportFraction: 0.8,
                                ),
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                      width: 400,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          widget.ContentSegments[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 22,
                                              fontFamily: 'Alkatra'),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  index < widget.InputImagesSequence.length
                                      ? Container(
                                          width: 400,
                                          child: Image.file(
                                              //File(widget.InputImagesSequence[int.parse(widget.ContentImageSequence[index])])
                                              File(widget.InputImagesSequence[index])

                                              //int.parse(widget.InputImagesSequence[index ~/3])
                                              // width: 50,
                                              // height: 50,
                                              //  fit: BoxFit.cover,
                                              ))
                                      : SizedBox(
                                          height: 20,
                                        ),
                                ],
                              );
                    //   index== widget.ContentImageSequence.length*3? SizedBox(height: 30,):
                    //   index== widget.ContentImageSequence.length*3+1? CarouselSlider(
                    //     items: ImaList,
                    //
                    //     options: CarouselOptions(
                    //       height: 300.0,
                    //       enlargeCenterPage: true,
                    //       autoPlay: true,
                    //       aspectRatio: 16 / 9,
                    //       autoPlayCurve: Curves.fastOutSlowIn,
                    //       enableInfiniteScroll: true,
                    //       autoPlayAnimationDuration: Duration(milliseconds: 600),
                    //       viewportFraction: 0.8,
                    //     ),
                    //   ):
                    //
                    // index%3==0? SizedBox(height: 20,):
                    // index%3==1? Container(
                    //   width: 400,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(6.0),
                    //     child: Text(widget.ContentSegments[index ~/3 ], style: TextStyle(fontWeight: FontWeight.normal,fontSize: 22, fontFamily: 'Alkatra'),),
                    //   )
                    // )
                    //
                    //     :Container(
                    //   width: 400,
                    //   child: Image.file(
                    //     File(widget.InputImagesSequence[int.parse(widget.ContentImageSequence[index ~/3])]),
                    //       //int.parse(widget.InputImagesSequence[index ~/3])
                    //    // width: 50,
                    //    // height: 50,
                    //   //  fit: BoxFit.cover,
                    //   ),
                    // )
                    // ;
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            /* CarouselSlider(
              items: [

                ImageContainer("https://prod-media-eng.dhakatribune.com/uploads/2018/07/web-dhaka-university-campus-edited-10-07-2018-1531241428773.jpg"),
                ImageContainer("http://photos1.blogger.com/x/blogger/7702/1941/1600/479828/1172.jpg"),
                ImageContainer("https://media.istockphoto.com/id/1341969105/photo/one-of-buildings-at-the-campus-of-university-of-dhaka-banglade.jpg?s=612x612&w=0&k=20&c=Yzjgh1p0nwISJSQ5mZQFup9UFTB_7Pufv2s2_gD0HQ0="),
                ImageContainer("https://www.tbsnews.net/sites/default/files/styles/amp_metadata_content_image_min_696px_wide/public/images/2020/07/18/_oor7838.jpg"),
                ImageContainer("https://www.daily-sun.com/assets/news_images/2017/05/15/1491406465_0.jpg"),
                ImageContainer("https://www.tbsnews.net/sites/default/files/styles/big_2/public/images/2020/07/25/01.jpg"),
                ImageContainer("https://tariqul09tmgmail.files.wordpress.com/2017/04/khonica-bus-photo.jpg"),
                ImageContainer("https://live.staticflickr.com/8844/18048563995_97020489fd_b.jpg"),
                ImageContainer("https://gumlet.assettype.com/bdnews24-english%2Fimport%2Fmedia%2F2022%2F02%2F04%2Frain-winter-dhaka-university-040222-17.jpg?auto=format%2Ccompress&fmt=webp&format=webp&w=732"),
                ImageContainer("https://www.tbsnews.net/sites/default/files/styles/big_3/public/images/2021/12/14/800px-rokeya_hall_dhaka_university.jpg"),
                ImageContainer("https://images.adsttc.com/media/images/606d/a7ce/f91c/8155/b900/03f9/newsletter/18.jpg?1617799072"),
                ImageContainer("https://www.du.ac.bd/fontView/assets/img/others/du_library.jpg"),
                ImageContainer("http://10minuteschool.com/blog/wp-content/uploads/2016/08/Picture1.jpg"),
                ImageContainer("https://lh5.googleusercontent.com/p/AF1QipN2JwWXPQGCgtzfphL0MGsGk7r4A8AIqF9qq7Av=w500-h500-k-no"),
                ImageContainer("https://www.bproperty.com/blog/wp-content/uploads/feature-14.jpg"),
                ImageContainer("https://i.pinimg.com/736x/be/d7/7d/bed77d31b46bd9389ae9e095ba393de5.jpg"),
                ImageContainer("https://i.pinimg.com/originals/34/33/51/34335183d054aa47027dbd018379464b.jpg"),
                ImageContainer("https://bangladeshpost.net/images-customizer/image/PhotoGallery/2021-11-618a0f077839b.jpg"),
                ImageContainer("https://c8.alamy.com/comp/KWA562/dancers-perform-in-the-spring-fest-on-the-faculty-of-fine-arts-campus-KWA562.jpg"),
                ImageContainer("https://mapio.net/images-p/106746588.jpg"),





              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 600),
                viewportFraction: 0.8,
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
