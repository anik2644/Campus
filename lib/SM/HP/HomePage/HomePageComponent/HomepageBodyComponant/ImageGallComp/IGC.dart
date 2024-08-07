import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageGalleryImageView extends StatefulWidget {
  final String src;
  final String title;
  final description;

  const ImageGalleryImageView({ required this.src, required this.title, required this.description});



  @override
  State<ImageGalleryImageView> createState() => _ImageGalleryImageViewState();
}

class _ImageGalleryImageViewState extends State<ImageGalleryImageView> {

  //String Description= "ছাত্র-ছাত্রীদের জন্য শ্ববিদ্যালয়ের দ্বার উন্মুক্ত হয় ১৯২১ সালের ১ জুলাই। সে সময়ের ঢাকার সবচেয়ে অভিজাত ও সৌন্দর্যমণ্ডিত রমনা এলাকায় প্রায় ৬০০ একর জমির উপর পূর্ববঙ্গ এবং আসাম প্রদেশের পরিত্যক্ত ভবনাদি এবং ঢাকা কলেজের (বর্তমান কার্জন হল) ভবনসমূহের সমন্বয়ে মনোরম পরিবেশে গড়ে উঠে ঢাকা বিশ্ববিদ্যালয়। প্রতিষ্ঠার এই দিনটি প্রতিবছর ঢাকা বিশ্ববিদ্যালয় দিবস হিসেবে পালন করা হয়।তিনটি অনুষদ ও ১২টি বিভাগ নিয়ে একটি আবাসিক বিশ্ববিদ্যালয় হিসেবে এর যাত্রা শুরু হয়। ঢাকা কলেজ ও জগন্নাথ কলেজের (বর্তমান জগন্নাথ বিশ্ববিদ্যালয়) ডিগ্রি ক্লাসে অধ্যয়নরত ছাত্রদের নিয়ে ঢাকা বিশ্ববিদ্যালয় যাত্রা শুরু করে। শুধু ছাত্র নয়, শিক্ষক এবং লাইব্রেরির বই ও অন্যান্য উপকরণ দিয়েও এই দুটি কলেজ ঢাকা বিশ্ববিদ্যালয়ের প্রতিষ্ঠায় সহযোগিতা করে। এই সহযোগিতা দানের কৃতজ্ঞতা হিসেবে এই বিশ্ববিদ্যালয়ের দু’টি হলের নামকরণ করা হয় ঢাকা হল (বর্তমানে ড. মুহম্মদ শহীদুল্লাহ হল) ও জগন্নাথ হল।[১৩]কলা, বিজ্ঞান ও আইন অনুষদের অন্তর্ভুক্ত ছিল সংস্কৃত ও বাংলা, ইংরেজি, শিক্ষা, ইতিহাস, আরবি, ইসলামি অধ্যয়ন, ফার্সি ও উর্দু, দর্শন, অর্থনীতি ও রাজনীতি, পদার্থবিদ্যা, রসায়ন, গণিত এবং আইন।প্রথম শিক্ষাবর্ষে বিভিন্ন বিভাগে মোট ছাত্রছাত্রীর সংখ্যা ছিল ৮৭৭ জন এবং শিক্ষক সংখ্যা ছিল মাত্র ৬০ জন। এই বিশ্ববিদ্যালয়ের প্রথম ছাত্রী লীলা নাগ (ইংরেজি বিভাগ; এমএ-১৯২৩)। যে সব প্রথীতযশা শিক্ষাবিদ বিশ্ববিদ্যালয়ের প্রতিষ্ঠালগ্নে শিক্ষকতার সাথে জড়িত ছিলেন তারা হলেনঃ হরপ্রসাদ শাস্ত্রী, এফ.সি. টার্নার, মুহম্মদ শহীদুল্লাহ, জি.এইচ. ল্যাংলি, হরিদাস ভট্টাচার্য, ডব্লিউ.এ.জেনকিন্স, রমেশচন্দ্র মজুমদার, স্যার এ. এফ. রাহমান, সত্যেন্দ্রনাথ বসু, নরেশচন্দ্র সেনগুপ্ত, জ্ঞানচন্দ্র ঘোষ প্রমুখ। দ্বিতীয় বিশ্বযুদ্ধকালীন অস্থিরতা ও ভারত বিভক্তি আন্দোলনের কারণে ঢাকা বিশ্ববিদ্যালয়ের অগ্রযাত্রা কিছুটা ব্যাহত হয়। ১৯৪৭ সালে ভারত ও পাকিস্তান নামক দুইটি স্বাধীন রাষ্ট্র প্রতিষ্ঠিত হয়। তৎকালীন পূর্ববঙ্গ তথা পূর্ব পাকিস্তানের রাজধানী ঢাকায় অবস্থিত প্রদেশের একমাত্র বিশ্ববিদ্যালয়-ঢাকা বিশ্ববিদ্যালয়কে কেন্দ্র করে এ দেশের মানুষের আশা-আকাঙ্ক্ষা উজ্জীবিত হয়। নতুন উদ্যমে ঢাকা বিশ্ববিদ্যালয়ের কর্মকাণ্ড শুরু হয়। তৎকালীন পূর্ববাংলার ৫৫ টি কলেজ এ বিশ্ববিদ্যালয়ের অধিভুক্ত হয়। ১৯৪৭-৭১ সময়ের মধ্যে ৫টি নতুন অনুষদ, ১৬টি নতুন বিভাগ ও ৪টি ইন্সটিটিউট প্রতিষ্ঠিত হয়।";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: Colors.white,),
        //automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        // actions: [
        //   HomePageFloatingButtion()
        // ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title.split(",")[0].trim(), style: TextStyle(color: Colors.white, fontFamily: 'Alkatra',fontSize: 20),),
          ],
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            children: [

              Card(
                borderOnForeground: false,
                color: Colors.black,
                elevation: 10, // You can adjust the elevation as needed
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0), // Adjust the radius as needed
                  child: CachedNetworkImage(
                    imageUrl: widget.src,
                    placeholder: (context, url) => // You can use any placeholder here
                    CircularProgressIndicator(), // or other widget of your choice
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
/*
              Card(
                color: Colors.black,
                elevation: 5, // You can adjust the elevation as needed
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                  child: ListTile(
                    title: Text(
                      widget.title,
                      style: TextStyle(color: Colors.white, fontFamily: 'Alkatra', fontSize: 20),
                    ),
                  ),
                ),
              ),
*/

              SizedBox(height: 20),
              Text(widget.description,style: TextStyle(fontSize: 18, fontFamily: 'SimpleBangla'),)
            ],

          ),
        ),
      ),
    );
  }
}
