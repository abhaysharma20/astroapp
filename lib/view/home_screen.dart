import 'package:astrofuse_abhay/controller/home_screen/home_screen_controller.dart';
import 'package:astrofuse_abhay/helpers/slider_indicator.dart';
import 'package:astrofuse_abhay/helpers/utility.dart';
import 'package:astrofuse_abhay/services/api_endpoints.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenController = Get.put(HomeScreenController());
  Future<void> getAPI() async {
    await homeScreenController.getAstrologersList();
    await homeScreenController.getCustomerHome();
  }

  Widget headingRow(
      {String? heading, VoidCallback? onTap, bool? hideTopPadding}) {
    return Padding(
      padding: EdgeInsets.only(
          top: hideTopPadding == true ? 0 : 1.2.h,
          bottom: 1.2.h,
          left: 1.2.h,
          right: 1.2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading!,
            style: TextStyle(fontSize: 18.5.sp, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: onTap!,
            child: Text(
              "View All",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeScreenBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          homeScreenController.bannerList.isNotEmpty
              ? Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  shadowColor: Colors.grey,
                  borderOnForeground: false,
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.h, top: 1.h),
                    child: CarouselWithIndicator(
                        images: homeScreenController.bannerList),
                  ),
                )
              : Container(),
          headingRow(heading: "Astrologers", onTap: () {}),
          Padding(
            padding: EdgeInsets.only(bottom: 1.2.h, left: 1.2.h, right: 1.2.h),
            child: SizedBox(
              height: Get.height / 4.2,
              width: Get.width,
              child: homeScreenController.astrologerRecordList.isNotEmpty
                  ? ListView.builder(
                      itemCount:
                          homeScreenController.astrologerRecordList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: Get.width / 3,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadowColor: Colors.grey,
                            borderOnForeground: true,
                            color: Colors.white,
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 0.5.h,
                                  left: 0.5.h,
                                  top: 0.5.h,
                                  bottom: 0.5.h),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    homeScreenController
                                                .astrologerRecordList[index]
                                                .profileImage ==
                                            null
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.yellow[200],
                                              radius: 4.7.h,
                                              child: CircleAvatar(
                                                child: SvgPicture.asset(
                                                    "assets/userDefaultImage.svg"),
                                                radius: 4.5.h,
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.yellow[200],
                                              radius: 4.7.h,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    "${ApiEndPoints.imageBaseUrl}${homeScreenController.astrologerRecordList[index].profileImage}"
                                                        .trim()),
                                                radius: 4.5.h,
                                              ),
                                            ),
                                          ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              homeScreenController
                                                  .astrologerRecordList[index]
                                                  .name!,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp)),
                                          SizedBox(height: 0.5.h),
                                          Text(
                                              "₹ ${homeScreenController.astrologerRecordList[index].charge!.toString()}/min"),
                                          SizedBox(height: 0.5.h),
                                          Utility.appButton(
                                              color: Colors.white,
                                              borderColor: Colors.green,
                                              height: 4.h,
                                              bottomPadding: 1.h,
                                              context,
                                              textColor: Colors.green,
                                              fontWeight: FontWeight.w500,
                                              "Connect",
                                              fontSize: 15.sp,
                                              () {}),
                                        ]),
                                  ]),
                            ),
                          ),
                        );
                      })
                  : const Center(child: Text("No Astrologers List Fetched")),
            ),
          ),
          headingRow(
              heading: "Latest from blog", onTap: () {}, hideTopPadding: true),
          Padding(
            padding: EdgeInsets.only(bottom: 1.2.h, left: 1.2.h, right: 1.2.h),
            child: SizedBox(
              height: Get.height / 4,
              width: Get.width,
              child: homeScreenController.customerHomeBlogList.isNotEmpty
                  ? ListView.builder(
                      itemCount:
                          homeScreenController.customerHomeBlogList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: 0.5.h,
                          ),
                          child: SizedBox(
                            width: Get.width / 2,
                            height: 25.h,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              shadowColor: Colors.grey,
                              borderOnForeground: false,
                              color: Colors.white,
                              elevation: 4,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 0.5.h),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      homeScreenController
                                                  .customerHomeBlogList[index]
                                                  .previewImage ==
                                              null
                                          ? Container()
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SizedBox(
                                                height: 15.h,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${ApiEndPoints.imageBaseUrl}${homeScreenController.customerHomeBlogList[index].previewImage}"
                                                          .trim(),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  homeScreenController
                                                      .customerHomeBlogList[
                                                          index]
                                                      .title!,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 17.sp)),
                                              SizedBox(height: 1.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "User ${homeScreenController.customerHomeBlogList[index].createdBy!}"),
                                                  Text(DateFormat(
                                                          "MMM DD, yyyy")
                                                      .format(DateTime.parse(
                                                          homeScreenController
                                                              .customerHomeBlogList[
                                                                  index]
                                                              .createdAt!))),
                                                ],
                                              )
                                            ]),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        );
                      })
                  : const Center(child: Text("No Blogs List Fetched")),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          actions: [
            SvgPicture.asset(
              "assets/wallet.svg",
              height: 2.5.h,
            ),
            SizedBox(
              width: 2.w,
            ),
            SvgPicture.asset(
              "assets/translate.svg",
              height: 2.5.h,
            ),
            SizedBox(
              width: 2.w,
            ),
            SvgPicture.asset(
              "assets/customer-service.svg",
              height: 2.5.h,
            ),
            SizedBox(
              width: 2.w,
            ),
          ],
          title: Text(
            "AstroFuse",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: getAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child:
                      homeScreenBody() // Replace YourContentWidget with your actual content widget
                  );
            } else {
              return homeScreenBody();
            }
          }),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(
            left: 1.2.h, right: 1.2.h, top: 0.5.h, bottom: 0.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Utility.appButton(context, "Chat With Astrologers", () {},
                imageWidget: Transform.scale(
                    scale: 0.8,
                    child: const Icon(Icons.chat, color: Colors.black)),
                width: Get.width / 2.2,
                bottomPadding: 0,
                height: 5.h,
                borderColor: Colors.transparent,
                fontWeight: FontWeight.w600,
                leftPadding: 0,
                textColor: Colors.black,
                fontSize: 14.sp,
                rightPadding: 0,
                color: Colors.yellow[800]),
            Utility.appButton(context, "Call With Astrologers", () {},
                bottomPadding: 0,
                imageWidget: Transform.scale(
                    scale: 0.8,
                    child: const Icon(Icons.call, color: Colors.black)),
                width: Get.width / 2.2,
                rightPadding: 0,
                leftPadding: 0,
                height: 5.h,
                borderColor: Colors.transparent,
                fontWeight: FontWeight.w600,
                textColor: Colors.black,
                fontSize: 14.sp,
                color: Colors.yellow[800]),
          ],
        ),
      ),
    );
  }
}
