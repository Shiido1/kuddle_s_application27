class LoginModel {
  bool? success;
  String? message;
  String? token;
  int? userID;

  User? user;

  LoginModel({this.success, this.message, this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['accessToken'];
    userID = json['userID'];

    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['accessToken'] = token;
    data['userID'] = userID;

    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}




class User {

  String? username;
  String? userID;
  String? hashedPassword;
  String? lastName;
  String? firstName;
  String? email;
  String? phoneNumber;


  User({
    this.username,
    this.hashedPassword,
    this.lastName,
    this.firstName,
    this.email,
    this.phoneNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    hashedPassword = json['password']; // Update this line if needed
    lastName = json['lastName'];
    firstName = json['firstName'];
    email = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": hashedPassword, // Update this line if needed
      "lastName": lastName,
      "firstName": firstName,
      "emailAddress": email,
      "phoneNumber": phoneNumber,
    };
  }
}

class Data {
  int? id;
  String? type;
  String? name;
  String? email;
  dynamic age;
  dynamic gender;
  dynamic countryCode;
  String? mobile;
  dynamic emailVerifiedAt;
  dynamic otp;
  String? deviceId;
  String? deviceType;
  String? deviceName;
  String? deviceToken;
  String? apiToken;
  dynamic profile;
  String? status;
  dynamic serviceType;
  dynamic yearExpreance;
  dynamic location;
  dynamic locationLat;
  dynamic locationLong;
  dynamic idProf;
  String? documentsApproved;
  dynamic isOnline;
  dynamic whatApp;
  dynamic sms;
  dynamic notification;
  String? serviceTypePrice;
  dynamic guarantorName;
  dynamic guarantorEmail;
  dynamic guarantorPhoneNumber;
  dynamic guarantorAddress;
  dynamic serviceDiscription;
  dynamic state;
  dynamic town;
  dynamic gpsLocationStatus;
  dynamic isPhoneVerified;
  String? createdAt;
  String? updatedAt;
  int? isPlanActive;

  Data(
      {this.id,
        this.type,
        this.name,
        this.email,
        this.age,
        this.gender,
        this.countryCode,
        this.mobile,
        this.emailVerifiedAt,
        this.otp,
        this.deviceId,
        this.deviceType,
        this.deviceName,
        this.deviceToken,
        this.apiToken,
        this.profile,
        this.status,
        this.serviceType,
        this.yearExpreance,
        this.location,
        this.locationLat,
        this.locationLong,
        this.idProf,
        this.documentsApproved,
        this.isOnline,
        this.whatApp,
        this.sms,
        this.notification,
        this.serviceTypePrice,
        this.guarantorName,
        this.guarantorEmail,
        this.guarantorPhoneNumber,
        this.guarantorAddress,
        this.serviceDiscription,
        this.state,
        this.town,
        this.gpsLocationStatus,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    gender = json['gender'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    emailVerifiedAt = json['email_verified_at'];
    otp = json['otp'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    deviceName = json['device_name'];
    deviceToken = json['device_token'];
    apiToken = json['api_token'];
    profile = json['profile'];
    status = json['status'];
    serviceType = json['service_type'];
    yearExpreance = json['year_expreance'];
    location = json['location'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
    idProf = json['id_prof'];
    documentsApproved = json['documents_approved'];
    isOnline = json['is_online'];
    whatApp = json['what_app'];
    sms = json['sms'];
    notification = json['notification'];
    serviceTypePrice = json['service_type_price'];
    guarantorName = json['guarantor_name'];
    guarantorEmail = json['guarantor_email'];
    guarantorPhoneNumber = json['guarantor_phone_number'];
    guarantorAddress = json['guarantor_address'];
    serviceDiscription = json['service_discription'];
    state = json['state'];
    town = json['town'];
    gpsLocationStatus = json['gps_location_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['gender'] = gender;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['email_verified_at'] = emailVerifiedAt;
    data['otp'] = otp;
    data['device_id'] = deviceId;
    data['device_type'] = deviceType;
    data['device_name'] = deviceName;
    data['device_token'] = deviceToken;
    data['api_token'] = apiToken;
    data['profile'] = profile;
    data['status'] = status;
    data['service_type'] = serviceType;
    data['year_expreance'] = yearExpreance;
    data['location'] = location;
    data['location_lat'] = locationLat;
    data['location_long'] = locationLong;
    data['id_prof'] = idProf;
    data['documents_approved'] = documentsApproved;
    data['is_online'] = isOnline;
    data['what_app'] = whatApp;
    data['sms'] = sms;
    data['notification'] = notification;
    data['service_type_price'] = serviceTypePrice;
    data['guarantor_name'] = guarantorName;
    data['guarantor_email'] = guarantorEmail;
    data['guarantor_phone_number'] = guarantorPhoneNumber;
    data['guarantor_address'] = guarantorAddress;
    data['service_discription'] = serviceDiscription;
    data['state'] = state;
    data['town'] = town;
    data['gps_location_status'] = gpsLocationStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
