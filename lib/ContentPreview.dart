import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ContentPreview extends StatefulWidget {

  final List<String> InputImagesSequence;// = [];
  final List<String> ContentImageSequence;// = [];
  final List<String> ContentSegments;

  const ContentPreview({required this.InputImagesSequence, required this.ContentImageSequence, required this.ContentSegments});// = [];

  @override
  _ContentPreviewState createState() => _ContentPreviewState();
}

class _ContentPreviewState extends State<ContentPreview> {
  List<String> selectedImages = [];

  List<String> bengaliPoemList = [
    'কবিতা প্রাথমিক\n'
        'চিত্রের মাধবে পাখির গান\n'
        'সময় হলো শূন্যের মাঝে বন্ধন\n'
        'সৃষ্টির রঙে হৃদয় সজান\n',

    'কবিতা দ্বিতীয়\n'
        'বাতাসের বন্যা মেঘের মেলা\n'
        'হাওয়া ছুয়ে যায় মেঘমালা\n'
        'বন্ধুর মেলা করে হাসা\n',

    'কবিতা তৃতীয়\n'
        'জীবনের নাটকে চিত্র প্রদর্শন\n'
        'সুখের নৃত্য হলো জনম নিত্যজন\n'
        'প্রেমের কাহিনী লিখে নাটক সৃষ্টি\n'

    'কবিতা ১\n'
        'সুরের আবেশে গান\n'
        'চিত্রের মাধবে চিত্র\n'
        'প্রেমের বাণী বহন\n'
        'মনের রঙে হৃদয় ব্যান্ধ\n',

    'কবিতা ২\n'
        'প্রকৃতির সুন্দর ব্যাপার\n'
        'পাখির গানে ভুবন সজল\n'
        'পথিকের পায়ে ধূল ছুঁয়ে\n'
        'মেঘের মেলা ছায়া লঞ্চল\n',

    'কবিতা ৩\n'
        'অধ্যাত্মের আলোকে তারা\n'
        'চাঁদের আলোয় রাতের মালা\n'
        'সুখের ফুলে চিরন্তন হলে\n'
        'প্রেমের আলোয় নিত্য বস্ত্র ধারা\n'
    'প্রথম কবিতা\n'
        'সবুজ ঘাসের মেলা\n'
        'চাঁদের আলোয় জ্বালা\n'
        'পাখির কান্না শোনা\n'
        'বন্ধুদের মিলনে হাসা\n',

    'দ্বিতীয় কবিতা\n'
        'প্রকৃতির সুন্দর দৃশ্য\n'
        'মেঘের ছায়ায় ঘুমের স্বপ্ন\n'
        'অম্বরের পুরণ রুপকথা\n'
        'বৃষ্টির ঝর্ণা মাঠের দূরে\n',

    'তৃতীয় কবিতা\n'
        'হিমের মেলা হাতের নাগরা\n'
        'বিদায় এলো আসছে সকাল\n'
        'শীতের পুরণ আকাশের আল\n'
        'বৃষ্টির আসা হলো আর বাতাসের কল\n',
  ];

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

  Future<void> pickImages() async {

    print(bengaliPoemList.length);
    print("list size");
    List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      setState(() {
        selectedImages = images.map((image) => image.path).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          ElevatedButton(
            onPressed:test,
            //pickImages,
            child: Text('Select Images'),
          ),
        ],
        title: Text('Content Preview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 20),
            // Text(
            //   'Selected Images:',
            //   style: TextStyle(fontSize: 18),
            // ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListView.builder(
                  itemCount: widget.ContentImageSequence.length*3,
                  itemBuilder: (context, index)  {
                    return index%3==0? SizedBox(height: 20,):
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
          ],
        ),
      ),
    );
  }
}
