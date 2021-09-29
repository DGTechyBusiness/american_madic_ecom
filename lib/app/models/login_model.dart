// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.user,
  });

  int status;
  String message;
  User user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "user": user == null ? null : user.toJson(),
  };
}

class User {
  User({
    this.userId,
    this.defaultAddress,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.status,
    this.creationDate,
    this.image,
    this.deviceId,
    this.fcmToken,
    this.dob,
    this.regDate,
    this.uuid,
    this.profileImage,
  });

  String userId;
  String defaultAddress;
  String name;
  String email;
  String phone;
  String password;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic zip;
  String status;
  DateTime creationDate;
  String image;
  String deviceId;
  String fcmToken;
  DateTime dob;
  DateTime regDate;
  String uuid;
  String profileImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"] == null ? null : json["user_id"],
    defaultAddress: json["defaultAddress"] == null ? null : json["defaultAddress"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    password: json["password"] == null ? null : json["password"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zip: json["zip"],
    status: json["status"] == null ? null : json["status"],
    creationDate: json["creation_date"] == null ? null : DateTime.parse(json["creation_date"]),
    image: json["image"] == null ? null : json["image"],
    deviceId: json["device_id"] == null ? null : json["device_id"],
    fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    regDate: json["reg_date"] == null ? null : DateTime.parse(json["reg_date"]),
    uuid: json["uuid"] == null ? null : json["uuid"],
    profileImage: json["profile_image"] == null ? null : json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "defaultAddress": defaultAddress == null ? null : defaultAddress,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "password": password == null ? null : password,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "zip": zip,
    "status": status == null ? null : status,
    "creation_date": creationDate == null ? null : creationDate.toIso8601String(),
    "image": image == null ? null : image,
    "device_id": deviceId == null ? null : deviceId,
    "fcm_token": fcmToken == null ? null : fcmToken,
    "dob": dob == null ? null : "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "reg_date": regDate == null ? null : "${regDate.year.toString().padLeft(4, '0')}-${regDate.month.toString().padLeft(2, '0')}-${regDate.day.toString().padLeft(2, '0')}",
    "uuid": uuid == null ? null : uuid,
    "profile_image": profileImage == null ? null : profileImage,
  };
}
