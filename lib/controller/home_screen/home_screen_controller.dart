import 'dart:convert';
import 'dart:io';

import 'package:astrofuse_abhay/helpers/textfile.dart';
import 'package:astrofuse_abhay/model/astrologer_model.dart';
import 'package:astrofuse_abhay/model/customer_home_model.dart';
import 'package:astrofuse_abhay/services/api_calls.dart';
import 'package:astrofuse_abhay/services/api_endpoints.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // getAstrologersList();
    // getCustomerHome();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxInt totalAstrologersCount = 0.obs;
  AstrologerModel astrologerModelData = AstrologerModel();
  final astrologerRecordList = <AstrologerRecordList>[].obs;
  final pro = <String>[].obs;
  Future<AstrologerModel> getAstrologersList({String? category}) async {
    Map<String, String> headers = {};
    final response = await NetworkUtil.postApi(
      ApiEndPoints.getAstrologer,
      {"token": ConstantStrings.token},
      headers: headers,
    );
    if (response != null) {
      astrologerModelData =
          AstrologerModel?.fromJson(jsonDecode(response.body));
      totalAstrologersCount.value = astrologerModelData.totalCount!;
      astrologerRecordList.clear();
      astrologerRecordList.addAll(astrologerModelData.recordList!);
    }
    return astrologerModelData;
  }

  CustomerHomeModel customerHomeModel = CustomerHomeModel();
  final customerHomeBannerList = <Banner>[].obs;
  final bannerList = <String>[].obs;
  final customerHomeBlogList = <Blog>[].obs;
  final customerHomeProductCategoryList = <ProductCategory>[].obs;
  final customerHomeAstroTalkInNewsList = <AstrotalkInNews>[].obs;
  final customerHomeAstrologyVideoList = <AstrologyVideo>[].obs;
  Future<CustomerHomeModel> getCustomerHome({String? category}) async {
    Map<String, String> headers = {};
    final response = await NetworkUtil.postApi(
      ApiEndPoints.getCustomerHome,
      {},
      headers: headers,
    );
    if (response != null) {
      if (json.decode(response.body)["status"] == 200) {
        customerHomeModel =
            CustomerHomeModel?.fromJson(jsonDecode(response.body));

        ///Clearing Lists
        customerHomeBannerList.clear();
        customerHomeBlogList.clear();
        bannerList.clear();

        customerHomeBannerList.addAll(customerHomeModel.banner!);
        for (var index = 0; index < customerHomeBannerList.length; index++) {
          bannerList.add(customerHomeBannerList[index].bannerImage!);
        }

        customerHomeBlogList.addAll(customerHomeModel.blog!);
        // customerHomeProductCategoryList
        //     .addAll(customerHomeModel.productCategory!);
        // customerHomeAstroTalkInNewsList
        //     .addAll(customerHomeModel.astrotalkInNews!);
        // customerHomeAstrologyVideoList
        //     .addAll(customerHomeModel.astrologyVideo!);
        print(customerHomeBlogList.value);
      }
    }
    return customerHomeModel;
  }
}
