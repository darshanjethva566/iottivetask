class LoginData {
  bool? success;
  int? userId;
  String? firstName;
  String? lastName;
  String? primaryEmail;
  String? profileImageURL;
  String? authToken;
  String? mobileNumber;
  int? rewardPoint;
  String? aliasId;
  String? saferPayToken;
  dynamic saferPayCardDetails;
  String? birthDate;

  LoginData(
      {this.success,
        this.userId,
        this.firstName,
        this.lastName,
        this.primaryEmail,
        this.profileImageURL,
        this.authToken,
        this.mobileNumber,
        this.rewardPoint,
        this.aliasId,
        this.saferPayToken,
        this.saferPayCardDetails,
        this.birthDate});

  LoginData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    primaryEmail = json['primaryEmail'];
    profileImageURL = json['profileImageURL'];
    authToken = json['authToken'];
    mobileNumber = json['mobileNumber'];
    rewardPoint = json['rewardPoint'];
    aliasId = json['aliasId'];
    saferPayToken = json['saferPayToken'];
    saferPayCardDetails = json['saferPayCardDetails'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['primaryEmail'] = primaryEmail;
    data['profileImageURL'] = profileImageURL;
    data['authToken'] = authToken;
    data['mobileNumber'] = mobileNumber;
    data['rewardPoint'] = rewardPoint;
    data['aliasId'] = aliasId;
    data['saferPayToken'] = saferPayToken;
    data['saferPayCardDetails'] = saferPayCardDetails;
    data['birthDate'] = birthDate;
    return data;
  }
}
