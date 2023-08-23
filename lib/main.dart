import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/SM/pages/feeds.dart';
import 'SM/components/life_cycle_event_handler.dart';
import 'SM/pages/FeedsStrategy.dart';
import 'SM/services/user_service.dart';
import 'SM/utils/config.dart';
import 'SM/utils/constants.dart';
import 'SM/utils/providers.dart';
import 'SM/view_models/theme/theme_view_model.dart';
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
            home: FeedsStrategy(),//Feeds(),// Homepage()//loading()// Homepage(),// tmdte(),//Homepage(),// tmdte(),//Homepage(),// add_fire(),//Hello()//Homepage(),
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

