//import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageBodyComponant/AdvertisePortion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomepageBodyComponant/AdvertisePortion.dart';
import 'HomepageBodyComponant/ImageGallery.dart';
import 'HomepageBodyComponant/StartButton.dart';

class HomePageBody extends StatefulWidget {

  ImageGallery iMageGallery = new ImageGallery();
  AdvertisePortion advertisePortion = AdvertisePortion();
  StartBUtton sTartbutton = new StartBUtton();

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.iMageGallery,
          SizedBox(height: 20,),
          widget.advertisePortion,
          widget.sTartbutton

        ],
      ),
    );
  }
}
