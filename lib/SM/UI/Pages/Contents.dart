
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/Classes/Contents/ContentsOffice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Firebase/FIREBASE.dart';
import '../../JSON_Management/Contents/JSONContentsOffice.dart';
import '../../JSON_Management/JSONFile.dart';
import '../../ModelClass/Content.dart';
import '../Components/Content/ContentCard.dart';

class Contents extends StatefulWidget {
  @override
  _ContentsState createState() => _ContentsState();
}


class _ContentsState extends State<Contents> with AutomaticKeepAliveClientMixin{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



  bool isLoading = true;
  int page = 5;
  bool loadingMore = false;
  ScrollController scrollController = ScrollController();

  List<Content> contents = [];


  Future<void> onrefresh() async {

    contents = [];

    contents = await ContentsOffice().updateContents();


    setState(() {
      isLoading = false;
    });

  }

  Future<void> fetchData() async {

    contents = [];

    contents = await ContentsOffice().getContents();


    setState(() {
      isLoading = false;
    });

  }

  @override
  void initState() {

    fetchData();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          page = page + 5;
          loadingMore = true;
        });
      }
    });
    super.initState();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    print('>>>');
    return Scaffold(
      backgroundColor: Colors.black,
      //key: scaffoldKey,


      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title:  Text(
          "ঢাবিয়ান সমাচার",//"Press me to enter",
          style: TextStyle(fontSize: 30,color: Colors.black, fontFamily: 'Alkatra',),
        )
        ,

        centerTitle: true,

      ),
      drawer:  Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,

              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 90,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn3.iconfinder.com/data/icons/eziconic-v1-0/256/02.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Portals Here !!!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  /* Expanded(
                    child: Text(
                      'Follow here to be updated..',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Adjust the position of the shadow
                  ),
                ],
              ),
              child: ListTile(
                leading:CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://images.prothomalo.com/prothomalo-bangla/2021-01/1d75151c-eff9-4e9f-ac28-aebc4618d00f/palo_bangla_og.png',
                  ),
                ),
                title: Text('Prothom Alo',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),

                onTap: () {

                  _launchURL("www.prothomalo.com");
                  // Handle drawer item tap
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Adjust the position of the shadow
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/C560BAQHXD8X7v34Ygg/company-logo_400_400/0/1593498509122?e=2147483647&v=beta&t=JrCVIAMRRVpGfckybkhxFjIHS_20KeqWBYTn3_qchvA',
                  ),
                ),
                title: Text('Daily Campus',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                onTap: () {
                  // Handle drawer item tap

                  _launchURL("www.thedailycampus.com");
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Adjust the position of the shadow
                  ),
                ],
              ),
              child: ListTile(
                leading:  CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://i1.sndcdn.com/avatars-RGgXraz1SPFZKU7x-9uYAAQ-t500x500.jpg',
                  ),
                ),
                title: Text('Reuters',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                onTap: () {

                  _launchURL("www.reuters.com");
                  // Handle drawer item tap
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Adjust the position of the shadow
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Back',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                onTap: () {
                  // Handle drawer item tap
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          Visibility(
            visible: !isLoading,
            child:// Container(child: Text("There will be some Contents here"),),
            RefreshIndicator(
              onRefresh: fetchData,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                // controller: scrollController,
                //physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //StoryWidget(),
                    Container(
                      //height: MediaQuery.of(context).size.height,
                        child:  ListView.builder(
                          controller: scrollController,
                          itemCount: contents.length,
                          shrinkWrap: true,
                          //  physics: ScrollPhysics(),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Content posts = contents[index];
                            //print(index);
                            //PostModel.fromJson(docs[index].data());
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ContentCard(post: posts),
                            );
                          },
                        )
                    ),
                  ],
                ),
              ),

            ),

            //DONE

          ),
          Visibility(
            visible: isLoading,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {

        List<Content> contents = await JSONContentsOffice().readFromJSON_content();
        print("Now From JSON \n\n\n\n");
        for (var entry in contents.asMap().entries) {
          int index = entry.key;
          Content content = entry.value;

          print('Index: $index');
          print('Title: ${content.Title}');
          print('Location: ${content.Location}');
          print('All Images List: ${content.AllImagesList}');
          print('Content Image Sequence: ${content.ContentImageSequence}');
          print('Content Segments: ${content.ContentSegments}');
          print('---------------------------');
        }
        /*
        *  for (Content content in contents) {
          print('Title: ${content.Title}'); // Use lowercase 'title' to match the property name
          print('Location: ${content.Location}'); // Use lowercase 'location'
          print('All Images List: ${content.AllImagesList}'); // Use lowercase 'allImagesList'
          print('Content Image Sequence: ${content.ContentImageSequence}'); // Use lowercase 'contentImageSequence'
          print('Content Segments: ${content.ContentSegments}'); // Use lowercase 'contentSegments'
          print('---------------------------');
        }*/

       print("Now From Firebase \n\n\n\n");

      },),



    );
  }

  @override
  bool get wantKeepAlive => true;
}
