import 'package:purplestage/utils/core_export.dart';


class ProviderModel {
  ProviderContent? content;
  ProviderModel({this.content});

  ProviderModel.fromJson(Map<String, dynamic> json) {

    content =
    json['content'] != null ? ProviderContent.fromJson(json['content']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.toJson();
    }
    return data;
  }
}

class ProviderContent {
  int? currentPage;
  List<ProviderData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? to;
  int? total;

  ProviderContent(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.path,
        this.to,
        this.total});

  ProviderContent.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ProviderData>[];
      json['data'].forEach((v) {
        data!.add(ProviderData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];

    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['path'] = path;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class ProviderData {
  String? id;
  String? userId;
  String? companyName;
  String? companyPhone;
  String? companyAddress;
  String? companyEmail;
  String? logo;
  String? logoFullPath;
  String? contactPersonName;
  String? contactPersonPhone;
  String? contactPersonEmail;
  int? orderCount;
  int? serviceManCount;
  int? serviceCapacityPerDay;
  int? ratingCount;
  double? avgRating;
  int? commissionStatus;
  int? commissionPercentage;
  int? isActive;
  int? isFavorite;
  String? createdAt;
  String? updatedAt;
  int? isApproved;
  String? zoneId;
  Owner? owner;
  ProviderProfile? provider_profile;
  int? serviceAvailability;
  bool? nextBookingEligibility;
  bool? scheduleBookingEligibility;
  bool? chatEligibility;
  List<String>? weekends;
  TimeSchedule? timeSchedule;
  List<SubscribedServices>? subscribedServices;
  String? cashLimitStatus;
  int? totalServiceServed;
  int? subscribedServicesCount;
  Coordinates? coordinates;
  double? distance;


  ProviderData(
      {this.id,
        this.userId,
        this.companyName,
        this.companyPhone,
        this.companyAddress,
        this.companyEmail,
        this.logo,
        this.logoFullPath,
        this.contactPersonName,
        this.contactPersonPhone,
        this.contactPersonEmail,
        this.orderCount,
        this.serviceManCount,
        this.serviceCapacityPerDay,
        this.ratingCount,
        this.avgRating,
        this.commissionStatus,
        this.commissionPercentage,
        this.isActive,
        this.isFavorite,
        this.createdAt,
        this.updatedAt,
        this.isApproved,
        this.zoneId,
        this.owner,
        this.provider_profile,
        this.subscribedServices,
        this.cashLimitStatus,
        this.serviceAvailability,
        this.nextBookingEligibility,
        this.scheduleBookingEligibility,
        this.chatEligibility,
        this.weekends,
        this.timeSchedule,
        this.totalServiceServed,
        this.subscribedServicesCount,
        this.coordinates,
        this.distance,
      });

  ProviderData.fromJson(Map<String, dynamic> json) {
    id = json['id']??"";
    userId = json['user_id']??"";
    companyName = json['company_name']??"";
    companyPhone = json['company_phone']??"";
    companyAddress = json['company_address']??"";
    companyEmail = json['company_email']??"";
    logo = json['logo']??"";
    logoFullPath = json['logo_full_path']??"";
    contactPersonName = json['contact_person_name']??"";
    contactPersonPhone = json['contact_person_phone']??"";
    contactPersonEmail = json['contact_person_email']??"";
    orderCount = json['order_count']??"";
    serviceManCount = json['service_man_count']??"";
    serviceCapacityPerDay = json['service_capacity_per_day']??"";
    ratingCount = json['rating_count']??"";
    avgRating = json['avg_rating'] != null ? double.tryParse(double.tryParse(json['avg_rating'].toString())!.toStringAsExponential(2)) : null;
    commissionStatus = json['commission_status']??"";
    commissionPercentage = int.tryParse(json['commission_percentage'].toString())??0;
    isActive = int.tryParse(json['is_active'].toString())??0;
    isFavorite = int.tryParse(json['is_favorite'].toString())??0;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    isApproved = json['is_approved']??"";
    zoneId = json['zone_id']??"";
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    provider_profile = json['provider_profile'] != null
        ? ProviderProfile.fromJson(json['provider_profile'])
        : ProviderProfile.empty();
    serviceAvailability = int.tryParse(json['service_availability'].toString());
    nextBookingEligibility = json['nextBookingEligibility'];
    scheduleBookingEligibility = json['scheduleBookingEligibility'];
    chatEligibility = json['chatEligibility'];
    timeSchedule = json['time_schedule'] != null
        ? TimeSchedule.fromJson(json['time_schedule'])
        : null;
    weekends = json['weekends'] != null ? json['weekends'].cast<String>() : [];
    if (json['subscribed_services'] != null) {
      subscribedServices = <SubscribedServices>[];
      json['subscribed_services'].forEach((v) {
        subscribedServices!.add(SubscribedServices.fromJson(v));
      });
    }
    cashLimitStatus = json['cash_limit_status'];
    totalServiceServed = int.tryParse(json['total_service_served'].toString());
    subscribedServicesCount = int.tryParse(json['subscribed_services_count'].toString());
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['company_name'] = companyName;
    data['company_phone'] = companyPhone;
    data['company_address'] = companyAddress;
    data['company_email'] = companyEmail;
    data['logo'] = logo;
    data['logo_full_path'] = logoFullPath;
    data['contact_person_name'] = contactPersonName;
    data['contact_person_phone'] = contactPersonPhone;
    data['contact_person_email'] = contactPersonEmail;
    data['order_count'] = orderCount;
    data['service_man_count'] = serviceManCount;
    data['service_capacity_per_day'] = serviceCapacityPerDay;
    data['rating_count'] = ratingCount;
    data['avg_rating'] = avgRating;
    data['commission_status'] = commissionStatus;
    data['commission_percentage'] = commissionPercentage;
    data['is_active'] = isActive;
    data['is_favorite'] = isFavorite;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_approved'] = isApproved;
    data['zone_id'] = zoneId;
    data['service_availability'] = serviceAvailability;
    data['nextBookingEligibility'] = nextBookingEligibility;
    data['scheduleBookingEligibility'] = scheduleBookingEligibility;
    data['chatEligibility'] = chatEligibility;
    if (timeSchedule != null) {
      data['time_schedule'] = timeSchedule!.toJson();
    }
    data['weekends'] = weekends;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (subscribedServices != null) {
      data['subscribed_services'] =
          subscribedServices!.map((v) => v.toJson()).toList();
    }
    data['cash_limit_status'] = cashLimitStatus;
    data['total_service_served'] = totalServiceServed;
    data['subscribed_services_count'] = subscribedServicesCount;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }

    return data;
  }
}

class Owner {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? identificationNumber;
  String? identificationType;
  List<String>? identificationImage;
  String? gender;
  String? profileImage;
  String? fcmToken;
  int? isPhoneVerified;
  int? isEmailVerified;
  int? isActive;
  String? userType;
  String? createdAt;
  String? updatedAt;
  double? walletBalance;
  int? loyaltyPoint;

  Owner(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.identificationNumber,
        this.identificationType,
        this.identificationImage,
        this.gender,
        this.profileImage,
        this.fcmToken,
        this.isPhoneVerified,
        this.isEmailVerified,
        this.isActive,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.walletBalance,
        this.loyaltyPoint,
     });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    identificationNumber = json['identification_number'];
    identificationType = json['identification_type'];
    identificationImage = json['identification_image'].cast<String>();
    gender = json['gender'];
    profileImage = json['profile_image'];
    fcmToken = json['fcm_token'];
    isPhoneVerified = json['is_phone_verified'];
    isEmailVerified = json['is_email_verified'];
    isActive = json['is_active'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    walletBalance = double.tryParse(json['wallet_balance'].toString());
    loyaltyPoint = int.tryParse(json['loyalty_point'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['identification_number'] = identificationNumber;
    data['identification_type'] = identificationType;
    data['identification_image'] = identificationImage;
    data['gender'] = gender;
    data['profile_image'] = profileImage;
    data['fcm_token'] = fcmToken;
    data['is_phone_verified'] = isPhoneVerified;
    data['is_email_verified'] = isEmailVerified;
    data['is_active'] = isActive;
    data['user_type'] = userType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['wallet_balance'] = walletBalance;
    data['loyalty_point'] = loyaltyPoint;
    return data;
  }
}

class SubscribedServices {
  String? id;
  String? providerId;
  String? categoryId;
  String? subCategoryId;
  int? isSubscribed;
  String? createdAt;
  String? updatedAt;
  SubCategory? subCategory;

  SubscribedServices(
      {this.id,
        this.providerId,
        this.categoryId,
        this.subCategoryId,
        this.isSubscribed,
        this.createdAt,
        this.updatedAt,
        this.subCategory});

  SubscribedServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    isSubscribed = json['is_subscribed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subCategory = json['sub_category'] != null
        ? SubCategory.fromJson(json['sub_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['provider_id'] = providerId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['is_subscribed'] = isSubscribed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subCategory != null) {
      data['sub_category'] = subCategory!.toJson();
    }
    return data;
  }
}

class SubCategory {
  String? id;
  String? parentId;
  String? name;
  String? image;
  int? position;
  String? description;
  int? isActive;
  int? isFeatured;
  String? createdAt;
  String? updatedAt;

  SubCategory(
      {this.id,
        this.parentId,
        this.name,
        this.image,
        this.position,
        this.description,
        this.isActive,
        this.isFeatured,
        this.createdAt,
        this.updatedAt});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    image = json['image'];
    position = json['position'];
    description = json['description'];
    isActive = json['is_active'];
    isFeatured = int.tryParse(json['is_featured'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['name'] = name;
    data['image'] = image;
    data['position'] = position;
    data['description'] = description;
    data['is_active'] = isActive;
    data['is_featured'] = isFeatured;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class ProviderProfile {
  String? providerId;
  String? userId;
  String? name;
  String? phone;
  String? rpName;
  String? category;
  String? categoryName;
  String? bio;
  String? achievements;
  String? socialId1;
  String? socialId2;
  String? socialId3;
  String? photo;
  String? promoServices;
  String? otherDeliverable;
  String? cashHonorarium;
  String? benefits;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? profileFullPath; // This is from the $appends array

  ProviderProfile({
    this.providerId,
    this.userId,
    this.name,
    this.phone,
    this.rpName,
    this.category,
    this.categoryName,
    this.bio,
    this.achievements,
    this.socialId1,
    this.socialId2,
    this.socialId3,
    this.photo,
    this.promoServices,
    this.otherDeliverable,
    this.cashHonorarium,
    this.benefits,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.profileFullPath,
  });
  ProviderProfile.empty()
      : providerId = '',
        userId = '',
        name = '',
        phone = '',
        rpName = '',
        category = '',
        categoryName = '',
        bio = '',
        achievements = '',
        socialId1 = '',
        socialId2 = '',
        socialId3 = '',
        photo = '',
        promoServices = '',
        otherDeliverable = '',
        cashHonorarium = '',
        benefits = '',
        deletedAt = '',
        createdAt = '',
        updatedAt = '',
        profileFullPath = '';
  ProviderProfile.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    rpName = json['rp_name'];
    category = json['category'];
    categoryName = json['category_name'];
    bio = json['bio'];
    achievements = json['achievements'];
    socialId1 = json['social_id_1'];
    socialId2 = json['social_id_2'];
    socialId3 = json['social_id_3'];
    photo = json['photo'];
    promoServices = json['promo_services'];
    otherDeliverable = json['other_deliverable'];
    cashHonorarium = json['Cash_honorarium'];
    benefits = json['benefits'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileFullPath = json['profile_full_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider_id'] = providerId;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['rp_name'] = rpName;
    data['category'] = category;
    data['category_name'] = categoryName;
    data['bio'] = bio;
    data['achievements'] = achievements;
    data['social_id_1'] = socialId1;
    data['social_id_2'] = socialId2;
    data['social_id_3'] = socialId3;
    data['photo'] = photo;
    data['promo_services'] = promoServices;
    data['other_deliverable'] = otherDeliverable;
    data['Cash_honorarium'] = cashHonorarium;
    data['benefits'] = benefits;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_full_path'] = profileFullPath;
    return data;
  }
}
