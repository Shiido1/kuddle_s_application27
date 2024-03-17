class UserData {
  String status;
  List<UserInfo> result;

  UserData({required this.status, required this.result});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      status: json['status'],
      result: (json['Result'] as List)
          .map((userInfoJson) => UserInfo.fromJson(userInfoJson))
          .toList(),
    );
  }
}

class UserInfo {
  int? userID;
  String? username;
  String? avatar;
  // String passwordHash; // Adjust the data type based on the actual data structure
  String? profileImage;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  // Add more fields based on the actual data structure

  UserInfo({
    required this.userID,
    required this.username,
    required this.avatar,
    // required this.passwordHash,
    required this.profileImage,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.phoneNumber,
    // Add more fields based on the actual data structure
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userID: json['userID'],
      username: json['username'],
      avatar: json['avatar'],
      // passwordHash: json['passwordHash'],
      profileImage: json['profileImage'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      emailAddress: json['emailAddress'],
      phoneNumber: json['phoneNumber'],
      // Add more fields based on the actual data structure
    );
  }
}
