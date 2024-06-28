class LevelUser {
  int? level;
  String? levelName;
  List<Users>? users;

  LevelUser({this.level, this.levelName, this.users});

  LevelUser.fromJson(Map<String, dynamic> json) {
    level = json['Level'];
    levelName = json['level_name'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Level'] = this.level;
    data['level_name'] = this.levelName;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? fName;
  String? lName;
  String? email;
  Null? image;
  int? isPhoneVerified;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? emailVerificationToken;
  String? phone;
  int? isBlock;
  String? cmFirebaseToken;
  Null? temporaryToken;
  String? loginMedium;
  int? loyaltyPoint;
  num? walletBalance;
  String? referralCode;
  String? referredBy;
  int? loginHitCount;
  int? isTempBlocked;
  Null? tempBlockTime;
  String? languageCode;
  List<Orders>? orders;

  Users(
      {this.id,
      this.fName,
      this.lName,
      this.email,
      this.image,
      this.isPhoneVerified,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.emailVerificationToken,
      this.phone,
      this.isBlock,
      this.cmFirebaseToken,
      this.temporaryToken,
      this.loginMedium,
      this.loyaltyPoint,
      this.walletBalance,
      this.referralCode,
      this.referredBy,
      this.loginHitCount,
      this.isTempBlocked,
      this.tempBlockTime,
      this.languageCode,
      this.orders});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    image = json['image'];
    isPhoneVerified = json['is_phone_verified'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    emailVerificationToken = json['email_verification_token'];
    phone = json['phone'];
    isBlock = json['is_block'];
    cmFirebaseToken = json['cm_firebase_token'];
    temporaryToken = json['temporary_token'];
    loginMedium = json['login_medium'];
    loyaltyPoint = json['loyalty_point'];
    walletBalance = json['wallet_balance'];
    referralCode = json['referral_code'];
    referredBy = json['referred_by'];
    loginHitCount = json['login_hit_count'];
    isTempBlocked = json['is_temp_blocked'];
    tempBlockTime = json['temp_block_time'];
    languageCode = json['language_code'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['image'] = this.image;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email_verification_token'] = this.emailVerificationToken;
    data['phone'] = this.phone;
    data['is_block'] = this.isBlock;
    data['cm_firebase_token'] = this.cmFirebaseToken;
    data['temporary_token'] = this.temporaryToken;
    data['login_medium'] = this.loginMedium;
    data['loyalty_point'] = this.loyaltyPoint;
    data['wallet_balance'] = this.walletBalance;
    data['referral_code'] = this.referralCode;
    data['referred_by'] = this.referredBy;
    data['login_hit_count'] = this.loginHitCount;
    data['is_temp_blocked'] = this.isTempBlocked;
    data['temp_block_time'] = this.tempBlockTime;
    data['language_code'] = this.languageCode;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? userId;
  int? isGuest;
  num? orderAmount;
  String? beforeEditOrderAmount;
  String? backupAmount;
  int? orderEditRefund;
  int? couponDiscountAmount;
  Null? couponDiscountTitle;
  String? paymentStatus;
  String? orderStatus;
  num? totalTaxAmount;
  String? totalDistributedAmount;
  String? paymentMethod;
  Null? transactionReference;
  int? deliveryAddressId;
  String? createdAt;
  String? updatedAt;
  int? checked;
  int? editable;
  String? editStatus;
  int? deliveryManId;
  int? deliveryCharge;
  Null? orderNote;
  Null? couponCode;
  String? orderType;
  int? branchId;
  int? timeSlotId;
  String? date;
  String? deliveryDate;
  Null? callback;
  String? extraDiscount;
  DeliveryAddress? deliveryAddress;
  Null? paymentBy;
  Null? paymentNote;
  int? freeDeliveryAmount;
  List<ReferredIncome>? referredIncome;

  Orders(
      {this.id,
      this.userId,
      this.isGuest,
      this.orderAmount,
      this.beforeEditOrderAmount,
      this.backupAmount,
      this.orderEditRefund,
      this.couponDiscountAmount,
      this.couponDiscountTitle,
      this.paymentStatus,
      this.orderStatus,
      this.totalTaxAmount,
      this.totalDistributedAmount,
      this.paymentMethod,
      this.transactionReference,
      this.deliveryAddressId,
      this.createdAt,
      this.updatedAt,
      this.checked,
      this.editable,
      this.editStatus,
      this.deliveryManId,
      this.deliveryCharge,
      this.orderNote,
      this.couponCode,
      this.orderType,
      this.branchId,
      this.timeSlotId,
      this.date,
      this.deliveryDate,
      this.callback,
      this.extraDiscount,
      this.deliveryAddress,
      this.paymentBy,
      this.paymentNote,
      this.freeDeliveryAmount,
      this.referredIncome});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    isGuest = json['is_guest'];
    orderAmount = json['order_amount'];
    beforeEditOrderAmount = json['before_edit_order_amount'];
    backupAmount = json['backup_amount'];
    orderEditRefund = json['order_edit_refund'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountTitle = json['coupon_discount_title'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    totalTaxAmount = json['total_tax_amount'];
    totalDistributedAmount = json['total_distributed_amount'];
    paymentMethod = json['payment_method'];
    transactionReference = json['transaction_reference'];
    deliveryAddressId = json['delivery_address_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    checked = json['checked'];
    editable = json['editable'];
    editStatus = json['edit_status'];
    deliveryManId = json['delivery_man_id'];
    deliveryCharge = json['delivery_charge'];
    orderNote = json['order_note'];
    couponCode = json['coupon_code'];
    orderType = json['order_type'];
    branchId = json['branch_id'];
    timeSlotId = json['time_slot_id'];
    date = json['date'];
    deliveryDate = json['delivery_date'];
    callback = json['callback'];
    extraDiscount = json['extra_discount'];
    deliveryAddress = json['delivery_address'] != null
        ? new DeliveryAddress.fromJson(json['delivery_address'])
        : null;
    paymentBy = json['payment_by'];
    paymentNote = json['payment_note'];
    freeDeliveryAmount = json['free_delivery_amount'];
    if (json['referred_income'] != null) {
      referredIncome = <ReferredIncome>[];
      json['referred_income'].forEach((v) {
        referredIncome!.add(new ReferredIncome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['is_guest'] = this.isGuest;
    data['order_amount'] = this.orderAmount;
    data['before_edit_order_amount'] = this.beforeEditOrderAmount;
    data['backup_amount'] = this.backupAmount;
    data['order_edit_refund'] = this.orderEditRefund;
    data['coupon_discount_amount'] = this.couponDiscountAmount;
    data['coupon_discount_title'] = this.couponDiscountTitle;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['total_tax_amount'] = this.totalTaxAmount;
    data['total_distributed_amount'] = this.totalDistributedAmount;
    data['payment_method'] = this.paymentMethod;
    data['transaction_reference'] = this.transactionReference;
    data['delivery_address_id'] = this.deliveryAddressId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['checked'] = this.checked;
    data['editable'] = this.editable;
    data['edit_status'] = this.editStatus;
    data['delivery_man_id'] = this.deliveryManId;
    data['delivery_charge'] = this.deliveryCharge;
    data['order_note'] = this.orderNote;
    data['coupon_code'] = this.couponCode;
    data['order_type'] = this.orderType;
    data['branch_id'] = this.branchId;
    data['time_slot_id'] = this.timeSlotId;
    data['date'] = this.date;
    data['delivery_date'] = this.deliveryDate;
    data['callback'] = this.callback;
    data['extra_discount'] = this.extraDiscount;
    if (this.deliveryAddress != null) {
      data['delivery_address'] = this.deliveryAddress!.toJson();
    }
    data['payment_by'] = this.paymentBy;
    data['payment_note'] = this.paymentNote;
    data['free_delivery_amount'] = this.freeDeliveryAmount;
    if (this.referredIncome != null) {
      data['referred_income'] =
          this.referredIncome!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryAddress {
  int? id;
  String? addressType;
  String? contactPersonNumber;
  String? address;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? isGuest;
  String? contactPersonName;
  String? road;
  String? house;
  Null? floor;

  DeliveryAddress(
      {this.id,
      this.addressType,
      this.contactPersonNumber,
      this.address,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.isGuest,
      this.contactPersonName,
      this.road,
      this.house,
      this.floor});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'];
    contactPersonNumber = json['contact_person_number'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    isGuest = json['is_guest'];
    contactPersonName = json['contact_person_name'];
    road = json['road'];
    house = json['house'];
    floor = json['floor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_type'] = this.addressType;
    data['contact_person_number'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['is_guest'] = this.isGuest;
    data['contact_person_name'] = this.contactPersonName;
    data['road'] = this.road;
    data['house'] = this.house;
    data['floor'] = this.floor;
    return data;
  }
}

class ReferredIncome {
  int? id;
  int? userId;
  String? transactionId;
  num? credit;
  int? debit;
  int? balance;
  String? transactionType;
  String? creditedAt;
  int? status;
  String? reference;
  String? createdAt;
  String? updatedAt;

  ReferredIncome(
      {this.id,
      this.userId,
      this.transactionId,
      this.credit,
      this.debit,
      this.balance,
      this.transactionType,
      this.creditedAt,
      this.status,
      this.reference,
      this.createdAt,
      this.updatedAt});

  ReferredIncome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionId = json['transaction_id'];
    credit = json['credit'];
    debit = json['debit'];
    balance = json['balance'];
    transactionType = json['transaction_type'];
    creditedAt = json['credited_at'];
    status = json['status'];
    reference = json['reference'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['transaction_id'] = this.transactionId;
    data['credit'] = this.credit;
    data['debit'] = this.debit;
    data['balance'] = this.balance;
    data['transaction_type'] = this.transactionType;
    data['credited_at'] = this.creditedAt;
    data['status'] = this.status;
    data['reference'] = this.reference;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
