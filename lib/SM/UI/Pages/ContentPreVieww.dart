import 'package:dhabiansomachar/SM/UI/Components/ContentPreview/AppBar.dart';
import 'package:dhabiansomachar/SM/UI/Widgets/indicators.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContentPrevieww extends StatefulWidget {
  final List<String> InputImagesSequence; // = [];
  final List<String> ContentImageSequence; // = [];
  final List<String> ContentSegments;

  final String location;
  final String title;
  final String? optionalParameter;
  const ContentPrevieww(
      {required this.InputImagesSequence,
        required this.ContentImageSequence,
        required this.ContentSegments,
        required this.location,
        required this.title, this.optionalParameter}); // = [];

  @override
  _ContentPreviewwState createState() => _ContentPreviewwState();
}

class _ContentPreviewwState extends State<ContentPrevieww> {
  List<String> AllImagesList = [];
  String imgurl = "";
  bool isloading = false;
  int imgIndex=0;
  int textIndex=0;

  List<Widget> ImaList = [];
  List<Widget> listViewList =[];


  listViewLisMAker()
  {
    int index;
    for(index=0;index<widget.ContentImageSequence.length; index++)
      {
        if(widget.ContentImageSequence[index]=="0")
          {
            listViewList.add(Column(
              children: [
                SizedBox(height: 30,),
                Container(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        widget.ContentSegments[textIndex++],
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            fontFamily: 'Alkatra'),
                      ),
                    )),
                SizedBox(
                  height: 25,
                ),
              ],
            ));
          }
        else if(widget.ContentImageSequence[index]=="1")
          {
            listViewList.add(  Column(
              children: [
                Container(
                    width: 400,
                    child: widget.optionalParameter == "online_source"?
                    CachedNetworkImage(
                      imageUrl: widget.InputImagesSequence[imgIndex++],
                      placeholder: (context, url) => // You can use any placeholder here
                      CircularProgressIndicator(), // or other widget of your choice
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ):
                    Image.file(
                        File(widget.InputImagesSequence[imgIndex++])
                    )),
                SizedBox(height: 10),

              ],
            ));
          }

      }
    listViewList.add( SizedBox(height: 30,));
    listViewList.add( CarouselSlider(
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
    ));
  }

  Widget ImageContainer(int i) {
    return Container(
      margin: EdgeInsets.all(6.0),
      child:
       widget.optionalParameter == "online_source"?
    CachedNetworkImage(
      imageUrl:widget.InputImagesSequence[i],
      placeholder: (context, url) => // You can use any placeholder here
      CircularProgressIndicator(), // or other widget of your choice
      errorWidget: (context, url, error) => Icon(Icons.error),
    ):
      Image.file(
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
    listViewLisMAker();
    setState(() {

    });
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ContentAppBAr(
            optionalParameter: widget.optionalParameter,
            onLoading: (bool isload) {

              setState(() {
                isloading = isload;
              });

              print('getting the path: $isload');
            },
            InputImagesSequence: widget.InputImagesSequence, ContentImageSequence:widget.ContentImageSequence, ContentSegments: widget.ContentSegments, location: widget.location, title: widget.title,)),
      body: isloading? circularProgress(context):
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12.0),
            child: Card(
              color: Colors.black,
              elevation: 10.0, // Adjust the elevation as needed
              shadowColor: Colors.grey, // Adjust the shadow color as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30, bottom: 00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.book,
                          color: Colors.white, // Change to white
                          size: 40,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Change to white
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white, // Change to white
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            widget.location,
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.white, // Change to white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0,right: 14,bottom: 14),
              child: ListView.builder(
                itemCount: listViewList.length,
                itemBuilder: (context, index) {
                  return listViewList[index];
                },
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
