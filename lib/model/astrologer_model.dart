class AstrologerModel {
  List<AstrologerRecordList>? recordList;
  int? status;
  int? totalCount;

  AstrologerModel({this.recordList, this.status, this.totalCount});

  AstrologerModel.fromJson(Map<String, dynamic> json) {
    if (json['recordList'] != null) {
      recordList = <AstrologerRecordList>[];
      json['recordList'].forEach((v) {
        recordList!.add(new AstrologerRecordList.fromJson(v));
      });
    }
    status = json['status'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recordList != null) {
      data['recordList'] = this.recordList!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class AstrologerRecordList {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? contactNo;
  String? gender;
  String? birthDate;
  String? primarySkill;
  String? allSkill;
  String? languageKnown;
  String? profileImage;
  int? charge;
  int? experienceInYears;
  int? dailyContribution;
  String? hearAboutAstroguru;
  int? isWorkingOnAnotherPlatform;
  String? whyOnBoard;
  String? interviewSuitableTime;
  String? currentCity;
  String? mainSourceOfBusiness;
  String? highestQualification;
  String? degree;
  String? college;
  String? learnAstrology;
  String? astrologerCategoryId;
  String? instaProfileLink;
  String? facebookProfileLink;
  String? linkedInProfileLink;
  String? youtubeChannelLink;
  String? websiteProfileLink;
  int? isAnyBodyRefer;
  int? minimumEarning;
  int? maximumEarning;
  String? loginBio;
  String? noofforeignCountriesTravel;
  String? currentlyworkingfulltimejob;
  String? goodQuality;
  String? biggestChallenge;
  String? whatwillDo;
  int? isVerified;
  int? totalOrder;
  String? country;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? modifiedBy;
  String? nameofplateform;
  String? monthlyEarning;
  String? referedPerson;
  String? chatStatus;
  String? chatWaitTime;
  String? callStatus;
  String? callWaitTime;
  int? videoCallRate;
  int? reportRate;
  String? astrologerCategory;
  bool? isFreeAvailable;
  dynamic rating;

  AstrologerRecordList(
      {this.id,
        this.userId,
        this.name,
        this.email,
        this.contactNo,
        this.gender,
        this.birthDate,
        this.primarySkill,
        this.allSkill,
        this.languageKnown,
        this.profileImage,
        this.charge,
        this.experienceInYears,
        this.dailyContribution,
        this.hearAboutAstroguru,
        this.isWorkingOnAnotherPlatform,
        this.whyOnBoard,
        this.interviewSuitableTime,
        this.currentCity,
        this.mainSourceOfBusiness,
        this.highestQualification,
        this.degree,
        this.college,
        this.learnAstrology,
        this.astrologerCategoryId,
        this.instaProfileLink,
        this.facebookProfileLink,
        this.linkedInProfileLink,
        this.youtubeChannelLink,
        this.websiteProfileLink,
        this.isAnyBodyRefer,
        this.minimumEarning,
        this.maximumEarning,
        this.loginBio,
        this.noofforeignCountriesTravel,
        this.currentlyworkingfulltimejob,
        this.goodQuality,
        this.biggestChallenge,
        this.whatwillDo,
        this.isVerified,
        this.totalOrder,
        this.country,
        this.isActive,
        this.isDelete,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.modifiedBy,
        this.nameofplateform,
        this.monthlyEarning,
        this.referedPerson,
        this.chatStatus,
        this.chatWaitTime,
        this.callStatus,
        this.callWaitTime,
        this.videoCallRate,
        this.reportRate,
        this.astrologerCategory,
        this.isFreeAvailable,
        this.rating});

  AstrologerRecordList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    contactNo = json['contactNo'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    primarySkill = json['primarySkill'];
    allSkill = json['allSkill'];
    languageKnown = json['languageKnown'];
    profileImage = json['profileImage'];
    charge = json['charge'];
    experienceInYears = json['experienceInYears'];
    dailyContribution = json['dailyContribution'];
    hearAboutAstroguru = json['hearAboutAstroguru'];
    isWorkingOnAnotherPlatform = json['isWorkingOnAnotherPlatform'];
    whyOnBoard = json['whyOnBoard'];
    interviewSuitableTime = json['interviewSuitableTime'];
    currentCity = json['currentCity'];
    mainSourceOfBusiness = json['mainSourceOfBusiness'];
    highestQualification = json['highestQualification'];
    degree = json['degree'];
    college = json['college'];
    learnAstrology = json['learnAstrology'];
    astrologerCategoryId = json['astrologerCategoryId'];
    instaProfileLink = json['instaProfileLink'];
    facebookProfileLink = json['facebookProfileLink'];
    linkedInProfileLink = json['linkedInProfileLink'];
    youtubeChannelLink = json['youtubeChannelLink'];
    websiteProfileLink = json['websiteProfileLink'];
    isAnyBodyRefer = json['isAnyBodyRefer'];
    minimumEarning = json['minimumEarning'];
    maximumEarning = json['maximumEarning'];
    loginBio = json['loginBio'];
    noofforeignCountriesTravel = json['NoofforeignCountriesTravel'];
    currentlyworkingfulltimejob = json['currentlyworkingfulltimejob'];
    goodQuality = json['goodQuality'];
    biggestChallenge = json['biggestChallenge'];
    whatwillDo = json['whatwillDo'];
    isVerified = json['isVerified'];
    totalOrder = json['totalOrder'];
    country = json['country'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    nameofplateform = json['nameofplateform'];
    monthlyEarning = json['monthlyEarning'];
    referedPerson = json['referedPerson'];
    chatStatus = json['chatStatus'];
    chatWaitTime = json['chatWaitTime'];
    callStatus = json['callStatus'];
    callWaitTime = json['callWaitTime'];
    videoCallRate = json['videoCallRate'];
    reportRate = json['reportRate'];
    astrologerCategory = json['astrologerCategory'];
    isFreeAvailable = json['isFreeAvailable'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contactNo'] = this.contactNo;
    data['gender'] = this.gender;
    data['birthDate'] = this.birthDate;
    data['primarySkill'] = this.primarySkill;
    data['allSkill'] = this.allSkill;
    data['languageKnown'] = this.languageKnown;
    data['profileImage'] = this.profileImage;
    data['charge'] = this.charge;
    data['experienceInYears'] = this.experienceInYears;
    data['dailyContribution'] = this.dailyContribution;
    data['hearAboutAstroguru'] = this.hearAboutAstroguru;
    data['isWorkingOnAnotherPlatform'] = this.isWorkingOnAnotherPlatform;
    data['whyOnBoard'] = this.whyOnBoard;
    data['interviewSuitableTime'] = this.interviewSuitableTime;
    data['currentCity'] = this.currentCity;
    data['mainSourceOfBusiness'] = this.mainSourceOfBusiness;
    data['highestQualification'] = this.highestQualification;
    data['degree'] = this.degree;
    data['college'] = this.college;
    data['learnAstrology'] = this.learnAstrology;
    data['astrologerCategoryId'] = this.astrologerCategoryId;
    data['instaProfileLink'] = this.instaProfileLink;
    data['facebookProfileLink'] = this.facebookProfileLink;
    data['linkedInProfileLink'] = this.linkedInProfileLink;
    data['youtubeChannelLink'] = this.youtubeChannelLink;
    data['websiteProfileLink'] = this.websiteProfileLink;
    data['isAnyBodyRefer'] = this.isAnyBodyRefer;
    data['minimumEarning'] = this.minimumEarning;
    data['maximumEarning'] = this.maximumEarning;
    data['loginBio'] = this.loginBio;
    data['NoofforeignCountriesTravel'] = this.noofforeignCountriesTravel;
    data['currentlyworkingfulltimejob'] = this.currentlyworkingfulltimejob;
    data['goodQuality'] = this.goodQuality;
    data['biggestChallenge'] = this.biggestChallenge;
    data['whatwillDo'] = this.whatwillDo;
    data['isVerified'] = this.isVerified;
    data['totalOrder'] = this.totalOrder;
    data['country'] = this.country;
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    data['nameofplateform'] = this.nameofplateform;
    data['monthlyEarning'] = this.monthlyEarning;
    data['referedPerson'] = this.referedPerson;
    data['chatStatus'] = this.chatStatus;
    data['chatWaitTime'] = this.chatWaitTime;
    data['callStatus'] = this.callStatus;
    data['callWaitTime'] = this.callWaitTime;
    data['videoCallRate'] = this.videoCallRate;
    data['reportRate'] = this.reportRate;
    data['astrologerCategory'] = this.astrologerCategory;
    data['isFreeAvailable'] = this.isFreeAvailable;
    data['rating'] = this.rating;
    return data;
  }
}
