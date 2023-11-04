import 'package:astrofuse_abhay/controller/landing_page/landing_page_controller.dart';
import 'package:astrofuse_abhay/view/call_screen.dart';
import 'package:astrofuse_abhay/view/chat_screen.dart';
import 'package:astrofuse_abhay/view/history_screen.dart';
import 'package:astrofuse_abhay/view/home_screen.dart';
import 'package:astrofuse_abhay/view/live_feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 13.5.sp);

  final TextStyle selectedLabelStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13.5.sp);

  LandingPage({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 6.5.h,
          child: BottomNavigationBar(
            elevation: 0,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey[500],
            selectedItemColor: Colors.black,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.chat,
                    size: 20.0,
                  ),
                ),
                label: 'Chat',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.live_tv_rounded,
                    size: 20.0,
                  ),
                ),
                label: 'Live',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.call,
                    size: 20.0,
                  ),
                ),
                label: 'Call',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.edit_calendar_sharp,
                    size: 20.0,
                  ),
                ),
                label: 'History',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
            useLegacyColorScheme: true,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white70,
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomeScreen(),
              ChatScreen(),
              LiveFeedScreen(),
              CallScreen(),
              HistoryScreen(),
            ],
          )),
    ));
  }
}
