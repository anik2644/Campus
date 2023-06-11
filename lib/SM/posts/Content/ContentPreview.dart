import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentPreview extends StatefulWidget {

  final List<String> InputImagesSequence;// = [];
  final List<String> ContentImageSequence;// = [];
  final List<String> ContentSegments;

  final String location;
  final String title;

  const ContentPreview({required this.InputImagesSequence, required this.ContentImageSequence, required this.ContentSegments, required this.location, required this.title});// = [];

  @override
  _ContentPreviewState createState() => _ContentPreviewState();
}

class _ContentPreviewState extends State<ContentPreview> {
  // List<String> selectedImages = [];
  //
  // List<String> bengaliPoemList = [
  //   'কবিতা প্রাথমিক\n'
  //       'চিত্রের মাধবে পাখির গান\n'
  //       'সময় হলো শূন্যের মাঝে বন্ধন\n'
  //       'সৃষ্টির রঙে হৃদয় সজান\n',
  //
  //   'কবিতা দ্বিতীয়\n'
  //       'বাতাসের বন্যা মেঘের মেলা\n'
  //       'হাওয়া ছুয়ে যায় মেঘমালা\n'
  //       'বন্ধুর মেলা করে হাসা\n',
  //
  //   'কবিতা তৃতীয়\n'
  //       'জীবনের নাটকে চিত্র প্রদর্শন\n'
  //       'সুখের নৃত্য হলো জনম নিত্যজন\n'
  //       'প্রেমের কাহিনী লিখে নাটক সৃষ্টি\n'
  //
  //   'কবিতা ১\n'
  //       'সুরের আবেশে গান\n'
  //       'চিত্রের মাধবে চিত্র\n'
  //       'প্রেমের বাণী বহন\n'
  //       'মনের রঙে হৃদয় ব্যান্ধ\n',
  //
  //   'কবিতা ২\n'
  //       'প্রকৃতির সুন্দর ব্যাপার\n'
  //       'পাখির গানে ভুবন সজল\n'
  //       'পথিকের পায়ে ধূল ছুঁয়ে\n'
  //       'মেঘের মেলা ছায়া লঞ্চল\n',
  //
  //   'কবিতা ৩\n'
  //       'অধ্যাত্মের আলোকে তারা\n'
  //       'চাঁদের আলোয় রাতের মালা\n'
  //       'সুখের ফুলে চিরন্তন হলে\n'
  //       'প্রেমের আলোয় নিত্য বস্ত্র ধারা\n'
  //   'প্রথম কবিতা\n'
  //       'সবুজ ঘাসের মেলা\n'
  //       'চাঁদের আলোয় জ্বালা\n'
  //       'পাখির কান্না শোনা\n'
  //       'বন্ধুদের মিলনে হাসা\n',
  //
  //   'দ্বিতীয় কবিতা\n'
  //       'প্রকৃতির সুন্দর দৃশ্য\n'
  //       'মেঘের ছায়ায় ঘুমের স্বপ্ন\n'
  //       'অম্বরের পুরণ রুপকথা\n'
  //       'বৃষ্টির ঝর্ণা মাঠের দূরে\n',
  //
  //   'তৃতীয় কবিতা\n'
  //       'হিমের মেলা হাতের নাগরা\n'
  //       'বিদায় এলো আসছে সকাল\n'
  //       'শীতের পুরণ আকাশের আল\n'
  //       'বৃষ্টির আসা হলো আর বাতাসের কল\n',
  // ];

  List<String> AllImagesList=[];
  String imgurl="";

  Future<void> AddThisContentToFireStore()
  async {
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
  print('String array added to Firestore collection with document ID successfully.');
  } catch (e) {
  print('Error adding string array to Firestore collection: $e');
  }
  }

  Future<void> SentAllImageTOFireStorage() async {

    AllImagesList.clear();
    for(int i=0;i<widget.InputImagesSequence.length;i++)
      {
        String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
        String temp= widget.title;
        String imgName= '$temp$i';

        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages =
        referenceRoot.child('contents');
        Reference referenceImageToUpload =
        referenceDirImages.child(imgName);

        try {
          //Store the file
          await referenceImageToUpload.putFile(File(widget.InputImagesSequence[i]));
          //Success: get the download URL
          imgurl = await referenceImageToUpload.getDownloadURL();

          print("Img URL:" +imgurl);
          AllImagesList.add(imgurl);
        } catch (error) {
        }
      }

    print("loop done");
    print(AllImagesList.toString());
    AddThisContentToFireStore();
  }

  List <Widget> ImaList =[];


  Future<void> test()async {

    print('Dropped items:');
    print( widget.ContentImageSequence);
    print('Images Numbers:');
    print( widget.InputImagesSequence);
    print("Content portions :");
    for(int i=0;i<widget.ContentSegments.length;i++)
    {
      print(widget.ContentSegments[i]);
      print("i = $i ");
    }


  }

  Widget ImageContainer(int i)
  {
    return  Container(
      margin: EdgeInsets.all(6.0),
      child: Image.file(
        File(widget.InputImagesSequence[i]),
        //int.parse(widget.InputImagesSequence[index ~/3])
        // width: 50,
        // height: 50,
        //  fit: BoxFit.cover,
      ),
    );
  }


  void ImgListCreator()
  {
    for(int i=0;i<widget.InputImagesSequence.length;i++)
      {
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
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          TextButton(
            style:  TextButton.styleFrom(
      backgroundColor: Colors.black, // Set the desired background color
      ),
            onPressed:(){

              SentAllImageTOFireStorage();
              Navigator.pop(context);
            },//test,
            //pickImages,
            child: Text('Post',style: TextStyle(color: Colors.white,fontSize: 17),),
          ),
        ],
        title: Text('Content Preview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: TextStyle(fontSize: 20),),
                  SizedBox(height: 5),
                  Text(widget.location, style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListView.builder(
                  itemCount: widget.ContentImageSequence.length*3+2,
                  itemBuilder: (context, index)  {
                    return
                      index== widget.ContentImageSequence.length*3? SizedBox(height: 30,):
                      index== widget.ContentImageSequence.length*3+1? CarouselSlider(
                        items: ImaList,

                        options: CarouselOptions(
                          height: 300.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 600),
                          viewportFraction: 0.8,
                        ),
                      ):

                    index%3==0? SizedBox(height: 20,):
                    index%3==1? Container(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(widget.ContentSegments[index ~/3 ], style: TextStyle(fontWeight: FontWeight.normal,fontSize: 22, fontFamily: 'Alkatra'),),
                      )
                    )

                        :Container(
                      width: 400,
                      child: Image.file(
                        File(widget.InputImagesSequence[int.parse(widget.ContentImageSequence[index ~/3])]),
                          //int.parse(widget.InputImagesSequence[index ~/3])
                       // width: 50,
                       // height: 50,
                      //  fit: BoxFit.cover,
                      ),
                    )
                    ;
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
