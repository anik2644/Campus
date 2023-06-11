import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/HP/HomePage/HomePage.dart';
import 'package:social_media_app/test/Multiple_Image_Taken.dart';
import 'package:social_media_app/test/dr.dart';
import 'package:social_media_app/test/m.dart';
import 'package:social_media_app/test/t.dart';
import 'package:social_media_app/test/tt.dart';
// import 'package:social_media_app/components/life_cycle_event_handler.dart';
// import 'package:social_media_app/landing/landing_page.dart';
// import 'package:social_media_app/screens/mainscreen.dart';
// import 'package:social_media_app/services/user_service.dart';
// import 'package:social_media_app/utils/config.dart';
// import 'package:social_media_app/utils/constants.dart';
// import 'package:social_media_app/utils/providers.dart';
// import 'package:social_media_app/view_models/theme/theme_view_model.dart';

import 'CreateContent.dart';
import 'ContentPreview.dart';
import 'SM/components/life_cycle_event_handler.dart';
import 'SM/screens/edit_profile.dart';
import 'SM/services/user_service.dart';
import 'SM/utils/config.dart';
import 'SM/utils/constants.dart';
import 'SM/utils/providers.dart';
import 'SM/view_models/theme/theme_view_model.dart';
import 'Ecommerce/EcommerceApp.dart';

import 'test/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.initFirebase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        detachedCallBack: () => UserService().setUserStatus(false),
        resumeCallBack: () => UserService().setUserStatus(true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider notifier, Widget? child) {
          return MaterialApp(
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            theme: themeData(
              notifier.dark ? Constants.darkTheme : Constants.lightTheme,
            ),
            home:
            //CreateContent(),
            //MultipleImage(),

            Homepage(),
            //ProductDetailsPage(),
            //PM(image: 'assets/images/Curzon.jpg', name: 'Honey', price: '19.98',)
            //ProductItem(image: 'assets/images/Curzon.jpg', name: 'Honey', price: '19.98',),//EcommerceApp(),// Homepage()//Drawerexample()//Homepage()//loading()// Homepage(),// tmdte(),//Homepage(),// tmdte(),//Homepage(),// add_fire(),//Hello()//Homepage(),
            // StreamBuilder(
            //   stream: FirebaseAuth.instance.authStateChanges(),
            //   builder: ((BuildContext context, snapshot) {
            //     return Homepage();
            //     // if (snapshot.hasData) {
            //     //   return TabScreen();
            //     // } else
            //     //   return Landing();
            //   }),
            // ),
          );
        },
      ),
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.nunitoTextTheme(
        theme.textTheme,
      ),
    );
  }
}

