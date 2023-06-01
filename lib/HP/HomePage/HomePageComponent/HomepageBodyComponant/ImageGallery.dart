import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {

  Widget ImageContainer(String url)
  {
    return  Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height /3 ,
      width: double.infinity,
      child: CarouselSlider(
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
