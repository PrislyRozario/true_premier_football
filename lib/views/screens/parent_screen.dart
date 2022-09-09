import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:true_premier_football/views/screens/fixtures_screen.dart';
import 'package:true_premier_football/views/screens/score_screen.dart';
import 'package:true_premier_football/views/screens/standing_screen.dart';
import 'package:true_premier_football/views/screens/video_screen.dart';
import '/consts/consts.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({
    Key? key,
    this.page = 0,
  }) : super(key: key);
  final int page;

  @override
  ParentScreenState createState() => ParentScreenState();
}

class ParentScreenState extends State<ParentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) async {
    if (index == 4) {
      if (GetPlatform.isAndroid) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        Share.share(
            'For getting all details about football,  Download the app now , AppLink : https://play.google.com/store/apps/details?id=${packageInfo.packageName}',
            subject: 'Look what we made!');
      } else {
        Share.share(
            'For getting all details about football,  Download the app now , AppLink : ${settingController.settings.value.iosAppShareLink}',
            subject: 'Look what we made!');
      }
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      //  length: settingsController.appPublishingControl.value ? 4 : 3,
      length: settingController.appPublishingControl.value ? 4 : 3,
      key: _scaffoldKey,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.backgro, AppColors.backgro2],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          // image: DecorationImage(
          //     image: AssetImage("assets/images/background.jpg"),
          //     fit: BoxFit.fill)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: const Text(
              AppTexts.appName,
              style: TextStyle(
                //  fontFamily: GoogleFonts.carterOne().fontFamily,
                fontWeight: FontWeight.bold,
                // fontSize: 24,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.backgro2.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  color: Colors.transparent,
                  height: 45,
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: Colors.red,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: AppSizes.size16),
                    //    unselectedLabelColor: AppColors.appbgcolor,
                    labelColor: Colors.white,

                    tabs: [
                      tab('FIXTURE'),
                      if (settingController.appPublishingControl.value)
                        tab('SCORE'),
                      tab('VIDEO'),
                      tab('STANDING'),
                    ],
                    physics: const NeverScrollableScrollPhysics(),
                    onTap: (i) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              const FixturesScreen(),
              if (settingController.appPublishingControl.value)
                const ScoreScreen(),
              const VideoScreen(),
              const StandingScreen(),
            ],
          ),
        ),
      ),
    );
  }

  tab(String name) {
    return Tab(
      child: Text(
        name,
        style: TextStyle(fontSize: AppSizes.size13),
        textAlign: TextAlign.center,
      ),
    );
  }
}
