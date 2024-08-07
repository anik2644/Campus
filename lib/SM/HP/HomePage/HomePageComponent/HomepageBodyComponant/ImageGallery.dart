import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ImageGallComp/IGC.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  Widget ImageContainer(String title, String url, description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context as BuildContext,
            MaterialPageRoute(
                builder: (context) => ImageGalleryImageView(
                      src: url,
                      title: title,
                      description: description,
                    )));
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(url),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      child: CarouselSlider(
        items: [
          ImageContainer(
              "স্কাই ভিউ,\nঢাকা বিশ্ববিদ্যালয়",
              "https://prod-media-eng.dhakatribune.com/uploads/2018/07/web-dhaka-university-campus-edited-10-07-2018-1531241428773.jpg",
              "ক্যাম্পাসের মনোমুগ্ধকর একটি স্কাই ভিউ এর মধ্যে তিন নেতার সমাধি যেন মাথা উচু করে দাঁড়িয়ে আছে। ঢাকার শাহবাগে অবস্থিত এই মহিমান্বিত স্মৃতিস্তম্ভটি বাংলা থেকে পাকিস্তান আন্দোলনের তিন প্রভাবশালী নেতার প্রতি শ্রদ্ধা নিবেদন করছে: এ কে ফজলুল হক, হোসেন শহীদ সোহরাওয়ার্দী এবং খাজা নাজিমুদ্দিন। সমাধিটি এই বিশিষ্ট ব্যক্তিদের শেষ বিশ্রামের স্থানগুলিকে অন্তর্ভুক্ত করে যারা ব্রিটিশ ভারতের সময় শুধুমাত্র বাংলার প্রধানমন্ত্রী হিসেবে দায়িত্ব পালন করেননি বরং পাকিস্তানের স্বাধীনতার পরেও তাদের প্রভাবশালী নেতৃত্বের ভূমিকা অব্যাহত রেখেছেন। ঐতিহাসিক তাৎপর্য সহ সমাধিটি জাতির ভাগ্য গঠনে এই নেতাদের স্থায়ী উত্তরাধিকারের একটি মর্মস্পর্শী প্রতীক হয়ে ওঠে।"),
          ImageContainer(
              "ভিসি চত্ত্বর,\nঢাকা বিশ্ববিদ্যালয়",
              "http://photos1.blogger.com/x/blogger/7702/1941/1600/479828/1172.jpg",
              "ঢাকা বিশ্ববিদ্যালয়ের ভিসি চত্বর ঐতিহাসিক ও প্রাকৃতিক গুরুত্বের একটি স্থান। ভাইস-চ্যান্সেলরের বাসভবনের সামনে অবস্থিত, এটি একটি রাজকীয় পুরানো রেইন ট্রি রয়েছে যা শুধুমাত্র এলাকার নান্দনিক সৌন্দর্য এ বাড়ায় না বরং পথচারীদের এবং সমাবেশের জন্য ছায়ার একটি প্রশান্ত ছাউনিও প্রদান করে। এই মনোরম স্পটটি কোলাহলপূর্ণ ইউনিভার্সিটি ক্যাম্পাসের মধ্যে একটি শান্ত পশ্চাদপসরণ হিসাবে কাজ করে।\n\n্রাকৃতিক সৌন্দর্যের পাশাপাশি, ভিসি চত্ত্বর বাংলাদেশের স্বাধীনতা যুদ্ধের সময় বীরত্বের সাথে তাদের জীবন উৎসর্গকারী শহীদদের স্মরণে মূর্তি দ্বারা সজ্জিত। এই মূর্তিগুলি নীরব হিসাবে দাঁড়িয়ে আছে, বীরদের সম্মান করে যারা দেশের স্বাধীনতা সুরক্ষিত করতে অগ্রণী ভূমিকা পালন করেছিল। সবুজের সমাহার, গাছের শান্ত উপস্থিতি এবং শহীদদের প্রতি গভীর শ্রদ্ধাঞ্জলি ভিসি চত্বর কে ঢাকা বিশ্ববিদ্যালয়ের মধ্যে শান্তি, ইতিহাস এবং স্থিতিস্থাপকতার প্রতীক করে তোলে। এটি একটি লালিত জমায়েতের স্থান হিসাবে দাঁড়িয়ে আছে যেখানে প্রকৃতি এবং স্মরণ একে অপরের সাথে জড়িত, এমন একটি স্থান তৈরি করে যা বিশ্ববিদ্যালয় সম্প্রদায়ের চেতনা এবং উত্তরাধিকারকে প্রতিফলিত করে।"),
          ImageContainer(
              "কার্জন হল,\nঢাকা বিশ্ববিদ্যালয়",
              "https://media.istockphoto.com/id/1341969105/photo/one-of-buildings-at-the-campus-of-university-of-dhaka-banglade.jpg?s=612x612&w=0&k=20&c=Yzjgh1p0nwISJSQ5mZQFup9UFTB_7Pufv2s2_gD0HQ0=",
              "কার্জন হল বাংলাদেশের রাজধানী ঢাকাতে অবস্থিত একটি ঐতিহাসিক ভবন, যা পুরাকীর্তি হিসেবে স্বীকৃত।এটি নির্মাণ করা হয় ঢাকা কলেজের ব্যবহারের জন্য। বর্তমানে এটি ঢাকা বিশ্ববিদ্যালয়ের বিজ্ঞান ও জীব বিজ্ঞান অণুষদের কিছু শ্রেনীকক্ষ ও পরীক্ষার হল হিসেবে ব্যবহৃত হচ্ছে।\n\nফেব্রুয়ারি ১৯, ১৯০৪ সালে ভারতের তৎকালীন ভাইসরয় ও গভর্নর জেনারেল - লর্ড কার্জন এটির ভিত্তি-প্রস্তর স্থাপন করেন। বঙ্গভঙ্গ ঘোষিত হওয়ার পর প্রাদেশিক রাজধানী হিসেবে ঢাকাকে গড়ে তোলার জন্য রমনা এলাকার যেসব ইমারতের গুরুত্ব বৃদ্ধি পায় কার্জন হল তার মধ্যে অন্যতম। দানী লিখেছেন, কার্জন হল নির্মিত হয়েছিল টাউন হল হিসেবে। কিন্তু শরীফউদ্দীন আহমদ এক প্রবন্ধে দেখিয়েছেন এ ধারণাটি ভুল। এটি নির্মিত হয় ঢাকা কলেজের পাঠাগার হিসেবে। এবং নির্মাণের জন্য অর্থ প্রদান করেন ভাওয়ালের রাজকুমার। ১৯০৪ সালের ঢাকা প্রকাশ লিখেছিল -ঢাকা কলেজ নিমতলীতে স্থানান্তরিত হইবে। এই কলেজের সংশ্রবে একটি পাঠাগার নির্মাণের জন্য সুযোগ্য প্রিন্সিপাল ডাক্তার রায় মহাশয় যত্নবান ছিলেন। বড়লাট বাহাদুরের আগমন উপলক্ষে ভাওয়ালের রাজকুমারগণ এ অঞ্চলে লর্ড কার্জন বাহাদুরের নাম চিরস্মরণীয় করিবার নিমিত্তে কার্জন হল নামে একটি সাধারণ পাঠাগার নির্মাণের জন্য দেড় লক্ষ টাকা দান করিয়াছেন। ১৯১১ সালে বঙ্গভঙ্গ রদ হলে, ঢাকা কলেজের ক্লাস নেয়া হতে থাকে কার্জন হলে। পরবর্তী সময়ে ১৯২১ সালে ঢাকা বিশ্ববিদ্যালয় স্থাপিত হলে কার্জন হল অন্তর্ভুক্ত হয় ঢাকা বিশ্ববিদ্যালয়ের বিজ্ঞান বিভাগের জন্য, যা আজও ব্যবহৃত হচ্ছে। \n\n১৯০৪ সালে ভারতের ভাইসরয় লর্ড জর্জ নাথানিয়েল কার্জন এই হলের ভিত্তিপ্রস্তর স্থাপন করেন এবং তারই নামানুসারে এ ভবনের নাম হয় কার্জন হল। এ ভবনটিতে সংযোজিত হয়েছে ইউরোপ ও মুগল স্থাপত্য রীতির দৃষ্টিনন্দন সংমিশ্রণ; আংশিকভাবে মুসলিম স্থাপত্যরীতিও অনুসরণ করা হয় এতে। ভবনের বহির্পৃষ্ঠে কালচে লাল রঙের ইট ব্যবহার করা হয়েছে। আধুনিক স্থাপত্য বিদ্যা এবং মোগল কাঠামোর সমন্বয়ে তৈরি করা হয়েছে এর খিলান ও গম্বুজগুলো।\n\nভাষা আন্দোলনের ইতিহাসের সাথে কার্জন হল জড়িয়ে আছে। ১৯৪৮ সালে এখানেই ঢাকা বিশ্ববিদ্যালয়ের ছাত্ররা তদানীন্তন পাকিস্তানের রাষ্ট্রভাষা হবে উর্দু এতদসংক্রান্ত জিন্নাহর ঘোষণার প্রতি প্রথম প্রতিবাদ জানিয়েছিল। ১৯৪৮ সালের ২৪ মার্চ কার্জন হলে অনুষ্ঠিত বিশেষ সমাবর্তনে জিন্নাহ পাকিস্তানের রাষ্ট্রভাষা উর্দু হবে বলে ঘোষণা করলে কার্জন হলে উপস্থিত ছাত্ররা তখনই নো-নো বলে প্রতিবাদ করে।"),
          ImageContainer(
              "টিএসসি,\nঢাকা বিশ্ববিদ্যালয়",
              "https://www.tbsnews.net/sites/default/files/styles/amp_metadata_content_image_min_696px_wide/public/images/2020/07/18/_oor7838.jpg",
              "বিশ্ববিদ্যালয়ের শিক্ষক-শিক্ষার্থী কেন্দ্র (টিএসসি) 1961 সালে প্রতিষ্ঠিত হয়েছিল। এটি অবশ্যই ঐতিহাসিকভাবে গুরুত্বপূর্ণ, যা ছাত্র ও শিক্ষকের পাশাপাশি সমাজের অন্যান্য সম্প্রদায়ের জন্য এর সুযোগ সুবিধা প্রদানের জন্য পরিচিত। \n\nশিক্ষক-স্টুডেন্ট সেন্টার, বাংলাদেশে একমাত্র কেন্দ্র যা বিশ্রাম এবং নির্দেশনার জন্য ডিজাইন করা হয়েছে। বিশ্ববিদ্যালয়ের জীবনকে একীভূত করে কমিউনিটি সেন্টার হিসাবে এর মূল্য রয়েছে এবং স্ব-নির্দেশিত কার্যকলাপের পৃষ্ঠপোষক হিসাবে কাজ করে যেখানে শিক্ষার্থীরা শিখে যে তারা তাদের বিশ্ববিদ্যালয় এবং তাদের দেশের কল্যাণের জন্য দায়ী। এ স্থানটি এক ধরনের ক্যাম্পাস কমিউনিটি জীবন গড়ে তুলতে চায় যা বিশ্ববিদ্যালয়ের আনুষ্ঠানিক একাডেমিক প্রোগ্রামের পরিপূরক। মাল্টিপারপাস হল, গেম রুম ইত্যাদি। এগুলো ক্যাম্পাসের সামাজিক ও সাংস্কৃতিক কেন্দ্র। ছাত্র এবং অনুষদ সদস্যরা ক্যাফেটেরিয়া এবং বইয়ের দোকানের লাউঞ্জ, খেলাধুলা এবং বিনোদনমূলক এলাকায় মিশে যায়। স্বীকৃত ক্যাম্পাস সংস্থাগুলি এখানে তাদের মিটিং এবং ফাংশন, বক্তৃতা এবং শিল্প প্রদর্শনী করে। আলোচনা সেশনগুলি প্রায়শই নির্ধারিত হয়, জার্নাল এবং বুলেটিন প্রকাশিত হয় এবং প্রতিযোগিতা অনুষ্ঠিত হয়, যা বিশ্ববিদ্যালয়কে সাংস্কৃতিক এবং সামাজিক অনুষ্ঠানের একটি বৈচিত্র্যময় এবং আকর্ষণীয় অনুষ্ঠান দেয়। এরই মধ্যে টিএসসি কিছু অনুষ্ঠানের জন্য কয়েকটি তারিখ নির্ধারণ করেছে। উদাহরণস্বরূপ, বসন্ত উৎসব (13-14 ফেব্রুয়ারি), বৈশাখি উৎসব (15-19 এপ্রিল), ফেটে দে লা মিউজিক (02 জুলাই) এবং বন্ধুত্ব দিবস (আগস্টের প্রথম রবিবার)। টিএসসি একটি নতুন পদ্ধতির সাথে ঢাকা বিশ্ববিদ্যালয়ের সাংস্কৃতিক দল গঠনের মাধ্যমে একটি কাজের ক্ষেত্র তৈরি করেছে যা ছাত্র সম্প্রদায়ের মধ্যে একটি বড় প্রভাব প্রতিফলিত করেছে।\n\nT.S.C. শিক্ষক, বিভিন্ন হলের ছাত্র, সামাজিক-সাংস্কৃতিক সংগঠনের কর্মীরা শিক্ষামূলক, সহপাঠ্যক্রমিক ও বিনোদনের বিভিন্ন অনুষ্ঠানের মাধ্যমে সাড়া ফেলেছে; বিভিন্ন বিভাগ এবং প্রতিষ্ঠানের জাতীয় ও আন্তর্জাতিক সেমিনার, সিম্পোজিয়া, নবীনদের এবং বিদায় সংবর্ধনা এবং ওরিয়েন্টেশন প্রোগ্রাম। বিশ্ববিদ্যালয় সাংবাদিক সমিতি, ঢাকা বিশ্ববিদ্যালয় দাবা ক্লাব, শিক্ষার্থীদের বিভিন্ন সামাজিক-সাংস্কৃতিক দল, রোভার স্কাউট, ঢাকা বিশ্ববিদ্যালয় প্রকাশনা কেন্দ্র, ব্যাংক, ইউটিলিটিশপ, ফুড কর্ণার এবং বাধন নামে একটি স্বেচ্ছাসেবী রক্তদান সংস্থার সুযোগ-সুবিধা রয়েছে বিশ্ববিদ্যালয়ের ছাত্র ছাত্রীদের জন্য।"),
          ImageContainer(
              "ড. মুহম্মদ শহীদুলাহ্ হল\nঢাকা বিশ্ববিদ্যালয়",
              "https://ssl.du.ac.bd/fontView/images/rfacility/1620110507HSH.jpg",
              "ড. মুহম্মদ শহীদুলাহ্ হল ঢাকা বিশ্ববিদ্যালয়ের শুরুর সময়ে প্রতিষ্ঠিত তিনটি আবাসিক হলগুলির একটি। এটি কার্জন হলের পিছনে অবস্থিত এবং এখানে থাকার জন্য দুটি সম্প্রসারিত ভবনসহ একটি প্রধান ভবন রয়েছে। এখানে কেবল বিজ্ঞান অনুষদের শিক্ষার্থীদের থাকার ব্যবস্থা করা হয়েছে। বর্তমান ড. মুহম্মদ শহীদুল্লাহ হল ছিল ঢাকা কলেজের জন্য নির্মিত প্রথম ছাত্রাবাস। ১৯০৮ সালের মার্চ মাসে এর নির্মাণকাজ শেষ হয়। কার্জন হলের নকশার সঙ্গে এই হলের নকশা সামঞ্জস্যপূর্ণ। ঢাকা বিশ্ববিদ্যালয় প্রতিষ্ঠিত হলে এটি ঢাকা বিশ্ববিদ্যালয়ের আবাসিক হল হিসেবে যুক্ত হয়। ১৯২১ সালে হলটি লাইটন হল নামে প্রতিষ্ঠিত ও পরবর্তীকালে একে ঢাকা হল নামে নামকরণ করা হয় এবং ১৯৬৯ সালে বিখ্যাত ভাষাবিদ ড. মুহম্মদ শহীদুল্লাহর মৃত্যুর পর তার নামে নতুন নামকরণ করা হয়। পরে ১৭ জুন, ২০১৭ সালে এই হলের নাম ড. মুহম্মদ শহীদুলাহ্ হল করা হয়।\n\nএই হলের সামনের বিশাল পুকুর আছে, ১৯৫২ সালে এই পুকুর ঘাটে বসেই ১৪৪ ধারা ভেঙে ভাষা আন্দোলনের মিছিল করার সিদ্ধান্ত নেয়া হয়। ১৯৭১ সালের মার্চ ২৫ রাতে এই হলের পাশেই পাকিস্তানি হানাদার বাহিনীর বিরুদ্ধে প্রথম প্রতিরোধ গড়ে তোলা হয়। যার ফলে ক্ষিপ্ত পাক সেনারা সর্বপ্রথম হত্যাকাণ্ডটি চালায় এই হলে ঢুকে। সেই রাতে বর্বর পাক সেনাদের হাতে খুন হন এ হলের আবাসিক শিক্ষক পদার্থবিজ্ঞান বিভাগের আতাউর রহমান খান খাদিম সহ আরো অনেকে।\n\nশহীদুল্লাহ হল এলাকার পূর্বের নাম ছিল বাগ-এ-মুসা খাঁ। এটি বারো ভূইয়াঁর অন্যতম ভূইয়াঁ ঈসা খাঁর পুত্র মুসা খাঁয়ের নামে নামাঙ্করণ করা হয়। মুসা খাঁ সুবেদার ইসলাম খাঁয়ের নিকট যুদ্ধে হেরে যাবার পর যুদ্ধাবন্দী হিসেবে আটক ছিল। তবে সুবেদার ইসলাম খাঁ তার প্রতি বেশ সহৃদয় ছিল। হাকিম হাবিবুর রহমানের মতে এটি একটি বাগান ছিল যা মুসলিম বাগান হিসেবেও বিখ্যাত ছিল। সেই সময়ের নিদর্শন হিসাবে রয়েছে মুসা খাঁয়ের মসজিদ, এবং সমাধি।\n\nহল কমপ্লেক্সটি ৫ একর (২.০ হেক্টর) জায়গা জুড়ে রয়েছে যাতে তিনটি বড় ছাত্র আবাসন রয়েছে যেখানে প্রায় ১৫০০ শিক্ষার্থী রয়েছে। তিনতলা মূল ভবনটি ১৯২১ সালে তৈরি করা হয়, যেটি কার্জন হলের নকশার সাথে সামঞ্জস্যপূর্ণ। পরবর্তী সময়ে দুটি পাঁচতলাভবন সংযোজন করা হয়। অন্যান্য ভবনের মধ্যে রয়েছে প্রভোস্ট অফিস, গ্রন্থাগার, শিক্ষার্থীদের পড়ার ঘর, ক্যান্টিন, মেস, মসজিদ এবং শিক্ষক, কর্মকর্তা এবং কেরানিদের থাকার ব্যবস্থা।\n\nএই হলে একটি মেস ভবন আছে যার উপর তলায় হলের সুদৃশ্য মসজিদ। এই হলের প্রশাসনিক ভবন লিটন হল নামে পরিচিত।\n\nকমপ্লেক্সের অভ্যন্তরে একটি বিশাল খেলার মাঠ এবং একটি পুকুর রয়েছে। এখানে বেশ কয়েকটি দোকানগুলি রয়েছে যা প্রতিদিনের প্রয়োজনীয় জিনিস সরবরাহ করে।\n\nএই হলটি বাংলাদেশের ছাত্র রাজনীতিতে গুরুত্বপূর্ণ ভূমিকা পালন করেছে।"),
          ImageContainer(
              "রাজু ভাস্কর্য,\nঢাকা বিশ্ববিদ্যালয়",
              "https://www.tbsnews.net/sites/default/files/styles/big_2/public/images/2020/07/25/01.jpg",
              "সন্ত্রাস বিরোধী রাজু স্মারক ভাস্কর্য ঢাকা বিশ্ববিদ্যালয়ের টি এস সি প্রাঙ্গনে অবস্থিত ঢাকার একটি অন্যতম প্রধান ভাস্কর্য নিদর্শন। এটি ১৯৯৭ এর শেষভাগে তৈরি হয়।  \n\n১৯৯২ সালের ১৩ই মার্চ গণতান্ত্রিক ছাত্র ঐক্যের সন্ত্রাস বিরোধী মিছিল চলাকালে সন্ত্রাসীরা গুলি করলে মিছিলের নেতৃত্বদানকারী বাংলাদেশ ছাত্র ইউনিয়নের কেন্দ্রীয় নেতা মঈন হোসেন রাজু নিহত হন। রাজুসহ সন্ত্রাস বিরোধী আন্দোলনের সকল শহীদের স্মরণে নির্মিত এই ভাস্কর্য ১৭ই সেপ্টেম্বর, ১৯৯৭ সালে ঢাকা বিশ্ববিদ্যালয়ের তৎকালীন উপাচার্য এ. কে. আজাদ চৌধুরী উদ্বোধন করেন। এই ভাস্কর্য নিমার্ণে জড়িত শিল্পীরা ছিলেন ভাস্কর শ্যামল চৌধুরী ও সহযোগী গোপাল পাল। নির্মাণ ও স্থাপনের অর্থায়নে ছিলেন - ঢাকা বিশ্ববিদ্যালয়ের প্রাক্তন শিক্ষক আতাউদ্দিন খান (আতা খান) ও মুন্সীগঞ্জ-বিক্রমপুর সমিতির সভাপতি, লায়ন নজরুল ইসলাম খান বাদল। ভাস্কর্যটির সার্বিক তত্ত্বাবধানে রয়েছে বাংলাদেশ ছাত্র ইউনিয়ন। \n\nএই ভাস্কর্যে ৮ জনের অবয়ব ফুটিয়ে তোলা হয়েছে। যাদের প্রতিকৃতি ব্যবহার করা হয়েছে তারা হলেন মুনীম হোসেন রানা, শাহানা আক্তার শিলু, সাঈদ হাসান তুহিন, আবদুল্লাহ মাহমুদ খান, তাসফির সিদ্দিক, হাসান হাফিজুর রহমান সোহেল, উৎপল চন্দ্র রায় ও গোলাম কিবরিয়া রনি।"),
          ImageContainer(
              "বৃষ্টিস্নাত উল্লাস,\nঢাকা বিশ্ববিদ্যালয়",
              "https://tariqul09tmgmail.files.wordpress.com/2017/04/khonica-bus-photo.jpg",
              " ঢাকা বিশ্ববিদ্যালয়ের শিক্ষার্থীদের জন্য পরিবহন পরিষেবা রয়েছে। বিশাল ছাত্র সমাজের জন্য বাসের সংখ্যা পর্যাপ্ত না হলেও এটি শিক্ষার্থীদের জন্য একটি বড় সুবিধা। শহরের বিভিন্ন স্থানের বাসের সময়সূচী পাওয়া যাবে বাস ডিপোতে। লাইব্রেরি বা শিক্ষক পরিষদের জন্য বিশ্ববিদ্যালয়ে আসা শিক্ষার্থীদের সাহায্য করার জন্য এমনকি বিশ্ববিদ্যালয়ের ছুটির দিনেও পরিষেবাটি সর্বদা উপলব্ধ। \n\nঢাকা বিশ্ববিদ্যালয় মোট ২১ টি বাস সেবা দিয়ে থাকে। যার মধ্যে উল্লাস এর ট্রিপ কার্জন হল থেকে পোস্তগোলা পর্যন্ত ।ছবিতে বৃষ্টিস্নাত উল্লাস এর একটি মুহুর্ত দেখা যাচ্ছে।"),
          ImageContainer(
              "চারুকলা ,\nঢাকা বিশ্ববিদ্যালয়",
              "https://live.staticflickr.com/8844/18048563995_97020489fd_b.jpg",
              "১৯২১ সালের জুলাইয়ের প্রথম দিনে স্যার পিজে হার্টগ বিশ্ববিদ্যালয়ের প্রথম উপাচার্য হিসেবে ঢাকা বিশ্ববিদ্যালয় শিক্ষার্থীদের জন্য তার দরজা খুলে দেয়। বিশ্ববিদ্যালয়টি ৬০০ একর জমির উপর রমনা নামে পরিচিত শহরের একটি মনোরম অংশে স্থাপিত হয়েছিল। এটি ১৯৬৩ সালে ঢাকা বিশ্ববিদ্যালয়ের সাথে একটি অধিভুক্ত কলেজে পরিণত হয়, এর নাম পরিবর্তন করে পূর্ব পাকিস্তান কলেজ অফ আর্টস অ্যান্ড ক্রাফটস রাখা হয়। ১৯৭১ সালে দেশ স্বাধীন হলে এর নাম হয় বাংলাদেশ সরকারি চারু ও কারুকলা কলেজ। \n\n১৯৮৩ সালে এটি একটি প্রতিষ্ঠান হিসাবে ঢাকা বিশ্ববিদ্যালয়ের সাথে একীভূত হয়। অবশেষে ২০০৮ সালে, এটি ঢাকা বিশ্ববিদ্যালয়ের একটি অনুষদে পরিণত হয়। এটি ১৯৫১ সালে ড্রয়িং এবং পেইন্টিং (ফাইন আর্ট) এবং গ্রাফিক ডিজাইন (কমার্শিয়াল আর্ট) বিভাগ শুরু করার উদ্দেশ্যে ছিল। যদিও ক্লাস ১৯৫১ সালে শুরু হয়েছিল, ১৯৪৮ সালে ড্রয়িং এবং পেইন্টিং বিভাগ প্রতিষ্ঠিত হয়েছিল। প্রথম যখন বিভাগটি প্রতিষ্ঠিত হয়েছিল তখন তাকে ফাইন আর্ট বলা হত। এখানে উল্লেখ করা যেতে পারে যে যে বিভাগে পশ্চিমা পদ্ধতিতে চিত্রকলা শেখানো হত তাকে কলকাতা গভর্নমেন্ট স্কুল অফ আর্ট-এ ফাইন আর্ট বিভাগও বলা হত। ১৯৭২ সালে প্রকাশিত চারু ও কারুকলা কলেজের সংক্ষিপ্ত পরিচিতিতে এই বিভাগটিকে চারুকলা (সুকুমার কলা) বিভাগ বলা হয়। ১৯৭৮ সালের সিলেবাসে একে বলা হয় ড্রয়িং অ্যান্ড পেইন্টিং বিভাগ (চারুকলা)। ১৯৮৩ সালে ইনস্টিটিউটটি ঢাকা বিশ্ববিদ্যালয়ের একটি পূর্ণাঙ্গ ইনস্টিটিউটে পরিণত হওয়ার পর এটি ড্রয়িং অ্যান্ড পেইন্টিং বিভাগ হিসাবে পরিচিতি লাভ করে এবং ফাইন আর্টকে পুরোপুরি বাদ দেয়। \n\nডিপার্টমেন্ট স্টুডেন্টদের BFA এবং MFA ডিগ্রী প্রদান করে এবং বর্তমান এ Ph.D. কোর্স চালু করা হয়েছে। বিভাগের পাঠ্যক্রম হল কোর্স সিস্টেম ভিত্তিক। এখানে ৪ বছরের বিএফএ কোর্স রয়েছে এবং চার বছরের জিপিএ একত্রিত করে চূড়ান্ত সিজিপিএ প্রস্তুত করা হয়। দুই বছরের এমএফএ কোর্সের ফলাফল একই পদ্ধতিতে প্রস্তুত করা হয়।"),
          ImageContainer(
              "শ্রাবনের বর্ষণ,\nঢাকা বিশ্ববিদ্যালয়",
              "https://gumlet.assettype.com/bdnews24-english%2Fimport%2Fmedia%2F2022%2F02%2F04%2Frain-winter-dhaka-university-040222-17.jpg?auto=format%2Ccompress&fmt=webp&format=webp&w=732",
              "মায়াবী শ্রাবণ মাসে, ঢাকা বিশ্ববিদ্যালয় ক্যাম্পাসের মধ্যে, টিএসসি (শিক্ষক-ছাত্র কেন্দ্র) এর প্রাণবন্ত হাব রোকেয়া হলের পাশে একটি জাদুকরী স্থান রয়েছে। মৃদু বৃষ্টির সময় এই বিশেষ লোকালটি জীবন্ত হয়ে ওঠে, নিছক কবিতার মুহূর্ত হয়ে ওঠে। যখন বৃষ্টির ফোঁটাগুলো স্বর্গ থেকে স্নিগ্ধভাবে ঝরছে, তখন ছাত্ররা, গুঁড়ি গুঁড়ি বৃষ্টিতে বিচলিত না হয়ে, পিচ ঢালা রাস্তায় হেটে যাচ্ছে। বাতাস ভেজা মাটির সতেজ ঘ্রাণে ভরা, এবং বৃষ্টির ফোঁটার ছন্দময় শব্দে চারপাশ জীবন্ত হয়ে ওঠে। এই প্রেক্ষাপটে, রিকশা ভেজা পথে চলাচল করে, বৃষ্টির সাথে এক সুরেলা নৃত্য তৈরি করে। শ্রাবণে বর্ষার সাথে এই মনোমুগ্ধকর মিলন একটি সাধারণ ক্যাম্পাসের পথচলাকে একটি নিরবধি, আনন্দদায়ক অভিজ্ঞতায় রূপান্তরিত করে, প্রকৃতির আলিঙ্গনের রঙে বিশ্ববিদ্যালয়কে রঙিন করে।"),
          ImageContainer(
              "রোকেয়া হল,\nঢাকা বিশ্ববিদ্যালয়",
              "https://www.tbsnews.net/sites/default/files/styles/big_3/public/images/2021/12/14/800px-rokeya_hall_dhaka_university.jpg",
              "রোকেয়া হল, ঢাকা বিশ্ববিদ্যালয়ের সবচেয়ে বড় মহিলা ছাত্রাবাস, ১৯৩৮ সালে শামসুল হুদা হাউস বা চামেরি হাউস নামে ১০-১২ জন ছাত্রীর সাথে মহিলা ছাত্রাবাসের প্রথম যাত্রা শুরু হয়। ১৯৫৬ সালে এটি উইমেনস হল হিসেবে পরিচিত হয়। ১৯৬৪ সালে, এটি উপমহাদেশের নারী স্বাধীনতা এবং নারী শিক্ষার অগ্রগণ্য বেগম রোকেয়া সাখাওয়াত হোসেনের নামে পরিচিত হয়। প্রফেসর আখতার ইমামকে এই হলের প্রথম প্রভাষক হিসেবে নিযুক্ত করা হয়। \n\n১৯৬৪ সালে রোকেয়া হলের প্রথম ভবনটি আমেরিকান সরকারের অনুদানে নির্মাণ হয়েছিল। ২০১৬ সালে ৭ই মার্চ ভবনের নির্মাণ সমাপ্ত হয়। বর্তমান প্রভাষক প্রফেসর ডঃ জিনাত হুদা এর উদ্যোগে ভবনের উদ্ভোদন সম্পর্কিত সমস্ত পদক্ষেপ ২০১৮ সালে সমাপ্ত হয়। ভবনটি সম্প্রতি সেপ্টেম্বর ২০১৮ সালে প্রধানমন্ত্রী শেখ হাসিনা দ্বারা উদ্বোধিত হয়েছিল। \n\nহলে শাপলা, চামেলি, অপরাজিত, এবং ৭ই মার্চ ভবন রয়েছে। বর্তমানে হলটির ৫২০টি কক্ষ আছে, এবং বাসিন্দাদের সংখ্যা প্রায় ২,৭০০ এবং সংযুক্ত ছাত্রীদের সংখ্যা প্রায় ৭,০০০।"),
          ImageContainer(
              "সমাজবিজ্ঞান চত্ত্বর,\nঢাকা বিশ্ববিদ্যালয়",
              "https://images.adsttc.com/media/images/606d/a7ce/f91c/8155/b900/03f9/newsletter/18.jpg?1617799072",
              "কেন্দ্রীয় মসজিদ, কেন্দ্রীয় গ্রন্থাগার, কেন্দ্রীয় ছাত্র ইউনিয়ন বিল্ডিং, একটি ঐতিহাসিক ক্যান্টিন এবং সামাজিক বিজ্ঞান অনুষদের নতুন ভবনের মতো উল্লেখযোগ্য ল্যান্ডমার্ক দ্বারা বেষ্টিত, আসল খোলা জায়গাটি ব্যবহার সম্পর্কিত কোনও তাৎপর্য তৈরি করতে ব্যর্থ হয়েছিল। ঢাকা বিশ্ববিদ্যালয়ের প্রাণকেন্দ্রে অবস্থিত হওয়া সত্ত্বেও এলাকাটি বছরের পর বছর ধরে অবহেলিত ছিল। জায়গাটিতে ব্যবহারকারীদের কাছে অফার করার মতো কিছুই ছিল না এবং বেশ কয়েক বছর ধরে নির্মাণ ধ্বংসাবশেষের শর্টকাট এবং ডাম্পিং জোনের জন্য ব্যবহার করা হচ্ছে। প্রাকৃতিক সেটিং ছিল এলোমেলো কিন্তু সূর্যালোক, মাটির অবস্থা এবং কম মানুষের হস্তক্ষেপের মতো প্রভাব দ্বারা পরিচালিত।  \n\nপ্রকল্পের উদ্দেশ্য ছিল তরুণ মনদের জন্য একটি মিটিং জায়গা তৈরি করা যাতে ছোট ছোট সমাবেশ করা যায় যা ছাত্র এবং শিক্ষকদের চিন্তাভাবনা এবং প্রতিফলনের জায়গা হিসাবে কাজ করতে পারে। এই ধরনের একটি বিশিষ্ট এলাকায় একটি উন্মুক্ত ল্যান্ডস্কেপ রক্ষণাবেক্ষণ অতিরিক্ত মনোযোগ দাবি করে এবং একটি আধা-খোলা খাদ্য স্টল এর প্রয়োজনীয়তা স্থানটিকে রক্ষণাবেক্ষণের পাশাপাশি স্থানটিকে জীবন্ত করে তুলতে অনুঘটক হিসাবে আবির্ভূত হয়। \n\nএকটি অ-স্থানকে একটি স্থানে রূপান্তরিত করার জন্য যা ব্যবহারকারীদের উপর প্রভাব তৈরি করতে সক্ষম, ডিজাইন কৌশলটি স্মৃতির একটি সংরক্ষণাগার তৈরির উপর দৃষ্টি নিবদ্ধ করে। একটি নিমজ্জিত জল-দেহ, রিভার্স অকুলাস, বায়ুমণ্ডলের সর্বদা পরিবর্তিত ঘটনার প্রতিফলন ধারণ করে এবং চিন্তা করার জন্য একটি জায়গা দেয়। জলের মাঝখানে রোপণ করা হিজল গাছ গ্রামের পুকুরের স্মৃতি মনে করার জন্য একটি চিত্র মূর্ত করে। নস্টালজিয়ায় মিশে বহু-সংবেদনশীল অভিজ্ঞতা তৈরি করতে এ স্থান টির জুড়ি নেই"),
          ImageContainer(
              "সাইন্স লাইব্রেরী,\nঢাকা বিশ্ববিদ্যালয়",
              "https://www.du.ac.bd/fontView/assets/img/others/du_library.jpg",
              "ঢাকা বিশ্ববিদ্যালয় গ্রন্থাগার, ঢাকা বিশ্ববিদ্যালয়ের কেন্দ্রীয় গ্রন্থাগার। এটি বাংলাদেশের সর্ববৃহৎ গ্রন্থাগার। গ্রন্থাগারটি ১৯২১ সালের ১ জুলাই বিশ্ববিদ্যালয়ের প্রতিষ্ঠালগ্নেই ঢাকা কলেজ ও ল কলেজ থেকে প্রাপ্ত প্রায় আঠারো হাজার বইয়ের সংগ্রহ নিয়ে যাত্রা শুরু করে। বর্তমানে এখানে প্রায় ৯ লক্ষ বই এবং জার্নালের সংগ্রহ রয়েছে। এছাড়াও, এখানে প্রায় ত্রিশ হাজারের মত বিরল পাণ্ডুলিপি রয়েছে। \n\nবিশ্ববিদ্যালয়ের বিজ্ঞান ভবনের প্রথম তলায় গ্রন্থাগারের জন্য ৪টি রিডিং রুম বরাদ্দ রয়েছে। এখানে একসাথে প্রায় ৪০০ শিক্ষার্থী পড়তে পারেন। এখানের সবগুলি কক্ষই শীতাতপ নিয়ন্ত্রিত। এছাড়া, এই ভবনের প্রথম তলায় একটি রেফারেন্স রুমও রয়েছে। শিক্ষক, গবেষক এবং শিক্ষার্থীরা এগুলি এবং রেফারেন্স সরঞ্জামগুলি এখানে ব্যবহার করতে পারেন। শিক্ষকদের জন্য আলাদা বসার ব্যবস্থা রয়েছে।  \n\nগ্রন্থাগারটিতে বর্তমানে প্রায় ৯ লক্ষ বই এবং জার্নাল রয়েছে। এছাড়াও, এখানে ৩০ হাজারেরও বেশি বিরল এবং পুরাতন পান্ডুলিপি, অসংখ্য মাইক্রোফিল্ম এবং মাইক্রোফাইচ রয়েছে। ২০০৭-২০০৮ সালে এখানে অনুদানসরূপ প্রাপ্ত ৩,১৮৮ টি বই এবং ১৮৭টি জার্নালের শিরোনাম যুক্ত করা হয়েছে। ওই অর্থবছরের বাজেটে শিক্ষাবর্ষের বই ও জার্নাল সংগ্রহের জন্য প্রায় ৯.৯ মিলিয়ন টাকা বরাদ্দ ছিল। বাজেটের অর্থ বাংলাদেশ বিশ্ববিদ্যালয় মঞ্জুরী কমিশনের মাধ্যমে প্রতি বছর বাংলাদেশ সরকারের থেকে প্রাপ্ত হয়।"),
          ImageContainer(
              "এফ বি এস,\nঢাকা বিশ্ববিদ্যালয়",
              "http://10minuteschool.com/blog/wp-content/uploads/2016/08/Picture1.jpg",
              "বিজনেস স্টাডিজ বিভাগ, যেটি ঢাকা বিশ্ববিদ্যালয়ের বুকে দাঁড়িয়ে আছে এর একটি সুদীর্ঘ ইতিহাস আছে. বিজনেস স্টাডিজ বিভাগটি 1921 সালে ঢাকা বিশ্ববিদ্যালয়ের কলা অনুষদের অধীনে প্রতিষ্ঠিত হয়। এই বিভাগটি 1970 সালে একটি স্বতন্ত্র অনুষদ হিসাবে আত্মপ্রকাশ করে। ম্যানেজমেন্ট বিভাগ এবং একাউন্টিং বিভাগ 1974 সালে তৈরি করা হয়েছিল। 1977-1978 সেশন থেকে এই অনুষদে সেমিস্টার পদ্ধতি চালু করা হয়েছিল। 1995 সালে বাণিজ্য অনুষদের নাম পরিবর্তন করে বিজনেস স্টাডিজ অনুষদ করা হয়। 1994-95 সময়কালে বি.কম-এর নাম। (অনার্স) এবং M.Com ডিগ্রী যথাক্রমে BBA এবং MBA ডিগ্রীতে পরিবর্তিত হয়েছে। \n\nএকই শিক্ষাবর্ষ থেকে ৩ বছরের বি.কম-এর পরিবর্তে ৪ বছর মেয়াদী বিবিএ প্রোগ্রাম চালু করা হয় (অনার্স) প্রোগ্রাম। এক বছরের এম.কম. প্রোগ্রামটির নাম পরিবর্তন করে এমবিএ প্রোগ্রামও রাখা হয়েছিল। 2004 সালে, এই অনুষদের অধীনে আরও দুটি বিভাগ তৈরি করা হয়েছিল, যথাক্রমে , ব্যাংকিং বিভাগ এবং ব্যবস্থাপনা তথ্য সিস্টেম বিভাগ (MIS)। 2007-2008 সালের একাডেমিক সেশনের সময়, এই অনুষদে আরও দুটি বিভাগ যোগ করা হয়েছিল, যথা, পর্যটন বিভাগ হসপিটালিটি ম্যানেজমেন্ট, আন্তর্জাতিক ব্যবসা বিভাগ এবং অর্গানাইজেশন স্ট্র্যাটেজি অ্যান্ড লিডারশিপ বিভাগ। বর্তমানে বিজনেস স্টাডিজ অনুষদের অধীনে 9টি বিভাগে 153 জন শিক্ষক, 10 জন কর্মকর্তা এবং 58 জন কর্মচারী এবং প্রায় 6,092 জন শিক্ষার্থী রয়েছেন।"),
          ImageContainer(
              "চারুকলা প্রাঙ্গন,\nঢাকা বিশ্ববিদ্যালয়",
              "https://lh5.googleusercontent.com/p/AF1QipN2JwWXPQGCgtzfphL0MGsGk7r4A8AIqF9qq7Av=w500-h500-k-no",
              "ছবিটিতে চারুকলা অনুষদ এর একটি  সুন্দর প্রাঙ্গনের ছবি দেখা যাচ্ছে। সেখানে ভাস্কর্য আর গাছপালা এর মিশ্রনে যেন অপরূপ এক নগরীর চিত্র ভেসে উঠেছে।শিল্পাচার্য জয়নুল আবেদিন ১৯৪৮ সালে গভর্নমেন্ট ইনস্টিটিউট অফ আর্ট প্রতিষ্ঠা করেন যা ছিল এদেশের প্রথম শিক্ষামূলক শিল্প প্রতিষ্ঠান এবং শেষ পর্যন্ত শিল্প ও সাংস্কৃতিক চর্চার প্রধান কেন্দ্র হয়ে ওঠে। এর শুরুতে, জয়নুল আবেদীন সহ অধ্যক্ষ ছিলেন ছয়জন শিক্ষক (আনোয়ারুল হক, কামরুল হাসান, সফিউদ্দিন আহমেদ, হাবিবুর রহমান এবং সৈয়দ আলী আহসান) এবং আঠারোজন ছাত্র। ফাইন আর্ট (বর্তমানে ড্রয়িং এবং পেইন্টিং) এবং কমার্শিয়াল আর্ট (বর্তমানে গ্রাফিক ডিজাইন) - এই ইনস্টিটিউটের কার্যক্রম দুটি বিভাগ দিয়ে শুরু হয়েছিল। ইনস্টিটিউটটি ঢাকার জনসন রোডে ডিএনএমআই হাসপাতাল ভবনে চালু হয়। ১৯৫২ সালে ইনস্টিটিউটটি সেগুন বাগিচায় একটি ভবনে স্থানান্তরিত হয় এবং তারপর ১৯৫৬ সালে, এটি শাহবাগে নিজস্ব প্রাঙ্গণে স্থানান্তরিত হয়। \n\n ১৯৮৩ সালে এই কলেজটি ঢাকা বিশ্ববিদ্যালয়ের সাথে একটি ইনস্টিটিউট হিসাবে একীভূত হয়। ১৯৯২-৯৩ সেশন থেকে অনার্স কোর্স চালু করা হয়। প্রতিষ্ঠানটিকে ২০০৮ সালে ঢাকা বিশ্ববিদ্যালয়ের চারুকলা অনুষদে পরিণত করা হয়। বর্তমানে এই অনুষদে আটটি বিভাগ রয়েছে। স্থায়ী শিক্ষক আছেন ৬৩ জন। ড্রয়িং অ্যান্ড পেইন্টিং বিভাগের অধ্যাপক নিসার হোসেন ৩০ এপ্রিল ২০১৯ সাল থেকে অনুষদের নির্বাচিত ডিনের দায়িত্ব পালন করছেন। "),
          ImageContainer(
              "বসন্তের শহর,\nঢাকা বিশ্ববিদ্যালয়",
              "https://www.bproperty.com/blog/wp-content/uploads/feature-14.jpg",
              "বসন্তে, আমাদের ক্যাম্পাস একটি রঙিন এবং সুন্দর জায়গায় পরিণত হয়। এটির ছবি: রাস্তার ধারে উজ্জ্বল লাল ফুলের এই আশ্চর্যজনক কৃষ্ণচূড়া গাছটি রয়েছে। বাতাস ফুলের সাথে মিষ্টি গন্ধ, এবং সূর্য আলতো করে পাতার মধ্য দিয়ে জ্বলে। শিক্ষার্থীরা গাছের নিচে হাঁটা উপভোগ করে এবং মাটি নরম, লাল পাপড়ি দিয়ে আচ্ছাদিত।\n\nএটি একটি ঐন্দ্রজালিক মুহুর্তের মতো যখন সবকিছু দেখায় এবং খুশি হয়। কৃষ্ণচূড়া গাছটি ঋতুর তারকা হয়ে ওঠে, যা বসন্তকালে আমাদের ক্যাম্পাসকে একটি শান্তিপূর্ণ এবং সুন্দর জায়গা করে তোলে।"),
          ImageContainer(
              "ভিসি চত্ত্বর,\nঢাকা বিশ্ববিদ্যালয়",
              "https://i.pinimg.com/736x/be/d7/7d/bed77d31b46bd9389ae9e095ba393de5.jpg",
              "ঢাকা বিশ্ববিদ্যালয়ের ভিসি চত্বর ঐতিহাসিক ও প্রাকৃতিক গুরুত্বের একটি স্থান। ভাইস-চ্যান্সেলরের বাসভবনের সামনে অবস্থিত, এটি একটি রাজকীয় পুরানো রেইন ট্রি রয়েছে যা শুধুমাত্র এলাকার নান্দনিক সৌন্দর্য এ বাড়ায় না বরং পথচারীদের এবং সমাবেশের জন্য ছায়ার একটি প্রশান্ত ছাউনিও প্রদান করে। এই মনোরম স্পটটি কোলাহলপূর্ণ ইউনিভার্সিটি ক্যাম্পাসের মধ্যে একটি শান্ত পশ্চাদপসরণ হিসাবে কাজ করে। \n\nপ্রাকৃতিক সৌন্দর্যের পাশাপাশি, ভিসি চত্ত্বর বাংলাদেশের স্বাধীনতা যুদ্ধের সময় বীরত্বের সাথে তাদের জীবন উৎসর্গকারী শহীদদের স্মরণে মূর্তি দ্বারা সজ্জিত। এই মূর্তিগুলি নীরব হিসাবে দাঁড়িয়ে আছে, বীরদের সম্মান করে যারা দেশের স্বাধীনতা সুরক্ষিত করতে অগ্রণী ভূমিকা পালন করেছিল। সবুজের সমাহার, বৃষ্টি গাছের শান্ত উপস্থিতি এবং শহীদদের প্রতি গভীর শ্রদ্ধাঞ্জলি ভিসি চত্বর কে ঢাকা বিশ্ববিদ্যালয়ের মধ্যে শান্তি, ইতিহাস এবং স্থিতিস্থাপকতার প্রতীক করে তোলে। এটি একটি লালিত জমায়েতের স্থান হিসাবে দাঁড়িয়ে আছে যেখানে প্রকৃতি এবং স্মরণ একে অপরের সাথে জড়িত, এমন একটি স্থান তৈরি করে যা বিশ্ববিদ্যালয় সম্প্রদায়ের চেতনা এবং উত্তরাধিকারকে প্রতিফলিত করে।"),
          ImageContainer(
              "বৃষ্টি ভেজা দিনগুলি,\nঢাকা বিশ্ববিদ্যালয়",
              "https://i.pinimg.com/originals/34/33/51/34335183d054aa47027dbd018379464b.jpg",
              "কল্পনা করুন: টিএসসি অডিটোরিয়ামের বাইরে, বৃষ্টি শুরু হচ্ছে , আর কিছু ছাত্রের হাতে ছাতা রয়েছে। তারা বৃষ্টিতে বিরক্ত না হয়ে বরং একটি দুর্দান্ত সময় কাটাচ্ছে।চারদিক এ বৃষ্টির ফোঁটা শুনা যাচ্ছে , এবং বাতাসে তাজা গন্ধ। সবাই হাসছে আর মুহূর্তটা উপভোগ করছে। টিএসসি এলাকা, যা সাধারণত সিরিয়াস ইভেন্ট এর জন্য, একটি আনন্দমুখোর জায়গা হয়ে ওঠে যেখানে শিক্ষার্থীরা বৃষ্টিতে ছাতা নিয়ে নাচ করে। এটা একটি উৎসব এর মতো, বৃষ্টির ঝরনা ক্যাম্পাসের কেন্দ্রস্থলে একটি বিশেষ স্মৃতি তৈরি করে।"),
          ImageContainer(
              "মায়াবি বিকেল,\nঢাকা বিশ্ববিদ্যালয়",
              "https://bangladeshpost.net/images-customizer/image/PhotoGallery/2021-11-618a0f077839b.jpg",
              "শান্তিপূর্ণ একটি বিকেলের দৃশ্যে, একটি প্রাচীন রেইন ট্রি ভিসি চত্তরের সামনে কেন্দ্রে অবস্থান করছে। গাছটি তার বিস্তৃত ডালপালা এবং ঝরা পাতার সাথে,শিক্ষার্থীদের জন্য একটি প্রশান্তির জায়গা হয়ে উঠে। দিন যত বাড়তে থাকে, কিছু যানবাহন আস্তে আস্তে চলে যায়। শিক্ষার্থীরা, শান্ত পরিবেশ উপভোগ করে, তাদের চারপাশের প্রাকৃতিক সৌন্দর্যে সান্ত্বনা খুঁজে পায়, প্রকৃতি, পরিবহন এবং রেইন ট্রি গাছের উপস্থিতির সাথে আসা শান্ত চিন্তার একটি সুরেলা মিশ্রণ তৈরি করে। \n\nএটি ক্যাম্পাস জীবনের একটি স্মৃতি, যেখানে গাছটি প্রাত্যহিক ক্রিয়াকলাপের কেন্দ্র এবং প্রবাহের নীরব সাক্ষী হয়ে।"),
          ImageContainer(
              "চারুকলার বটমূল,\nঢাকা বিশ্ববিদ্যালয়",
              "https://c8.alamy.com/comp/KWA562/dancers-perform-in-the-spring-fest-on-the-faculty-of-fine-arts-campus-KWA562.jpg",
              "শিল্পাচার্য জয়নুল আবেদিন ১৯৪৮ সালে গভর্নমেন্ট ইনস্টিটিউট অফ আর্ট প্রতিষ্ঠা করেন যা ছিল এদেশের প্রথম শিক্ষামূলক শিল্প প্রতিষ্ঠান এবং শেষ পর্যন্ত শিল্প ও সাংস্কৃতিক চর্চার প্রধান কেন্দ্র হয়ে ওঠে। এর শুরুতে, জয়নুল আবেদীন সহ অধ্যক্ষ ছিলেন ছয়জন শিক্ষক (আনোয়ারুল হক, কামরুল হাসান, সফিউদ্দিন আহমেদ, হাবিবুর রহমান এবং সৈয়দ আলী আহসান) এবং আঠারোজন ছাত্র। ফাইন আর্ট (বর্তমানে ড্রয়িং এবং পেইন্টিং) এবং কমার্শিয়াল আর্ট (বর্তমানে গ্রাফিক ডিজাইন) - এই ইনস্টিটিউটের কার্যক্রম দুটি বিভাগ দিয়ে শুরু হয়েছিল। ইনস্টিটিউটটি ঢাকার জনসন রোডে ডিএনএমআই হাসপাতাল ভবনে চালু হয়। ১৯৫২ সালে ইনস্টিটিউটটি সেগুন বাগিচায় একটি ভবনে স্থানান্তরিত হয় এবং তারপর ১৯৫৬ সালে, এটি শাহবাগে নিজস্ব প্রাঙ্গণে স্থানান্তরিত হয়। \n\n ১৯৮৩ সালে এই কলেজটি ঢাকা বিশ্ববিদ্যালয়ের সাথে একটি ইনস্টিটিউট হিসাবে একীভূত হয়। ১৯৯২-৯৩ সেশন থেকে অনার্স কোর্স চালু করা হয়। প্রতিষ্ঠানটিকে ২০০৮ সালে ঢাকা বিশ্ববিদ্যালয়ের চারুকলা অনুষদে পরিণত করা হয়। বর্তমানে এই অনুষদে আটটি বিভাগ রয়েছে। স্থায়ী শিক্ষক আছেন ৬৩ জন। ড্রয়িং অ্যান্ড পেইন্টিং বিভাগের অধ্যাপক নিসার হোসেন ৩০ এপ্রিল ২০১৯ সাল থেকে অনুষদের নির্বাচিত ডিনের দায়িত্ব পালন করছেন। \n\n চারুকলা এর বটমুল জায়গাটি এ অনুষদ এর একটি অন্যতম সুন্দর জায়গা। প্রকৃতি এবং গাছপালা এর মেলবন্ধন যেন শিক্ষার্থীদের জন্য এক পলক প্রশান্তির জায়গা হয়ে উঠে।"),
          ImageContainer(
              "কৃষঞ্চুড়া রাঙা সবুজ চত্ত্বর,\nঢাকা বিশ্ববিদ্যালয়",
              "https://mapio.net/images-p/106746588.jpg",
              "ঢাকা ইউনিভার্সিটিতে মলচত্বর নামের জায়গাটি কল্পনা করুন। সেখানে আপনি কৃষ্ণচূড়া গাছের সারি পাবেন। এই গাছগুলি বিশেষ কারণ তাদের উজ্জ্বল লাল ফুল রয়েছে যা রঙিন কার্পেটের মতো সবুজ ঘাসকে ঢেকে দেয়। এটি একটি সুন্দর ছবির মতো যেখানে প্রকৃতি তার নিজস্ব রঙে মাটিকে আঁকছে। এই এলাকাটি একটি জাদুকরী জায়গা হয়ে উঠেছে, ঢাকা বিশ্ববিদ্যালয়কে এমন একটি জায়গায় পরিণত করেছে যেখানে আপনি মলচত্তরের কৃষ্ণচূড়া গাছের সরল কিন্তু অত্যাশ্চর্য সৌন্দর্য উপভোগ করতে পারবেন।"),
        ],
        //Slider Container properties
        options: CarouselOptions(
          height: 230.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 600),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}

void main() {
  runApp(TermsAndCondition());
}

class TermsAndCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Gallery'),
        ),
        body: ImageGallery(),
      ),
    );
  }
}
