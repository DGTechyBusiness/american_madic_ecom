// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) => AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) => json.encode(data.toJson());

class AddressListModel {
  AddressListModel({
    this.address,
    this.status,
    this.message,
  });

  List<Address> address;
  int status;
  String message;

  factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
    address: json["address"] == null ? null : List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "address": address == null ? null : List<dynamic>.from(address.map((x) => x.toJson())),
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}

class Address {
  Address({
    this.id,
    this.userId,
    this.defaultAddress,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.status,
    this.creationDate,
  });

  String id;
  String userId;
  String defaultAddress;
  String name;
  String email;
  String phone;
  String address;
  String city;
  String state;
  String country;
  String zip;
  String status;
  DateTime creationDate;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"] == null ? null : json["id"],
    userId: json["userId"] == null ? null : json["userId"],
    defaultAddress: json["defaultAddress"] == null ? null : json["defaultAddress"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"] == null ? null : json["address"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    country: json["country"] == null ? null : json["country"],
    zip: json["zip"] == null ? null : json["zip"],
    status: json["status"] == null ? null : json["status"],
    creationDate: json["creation_date"] == null ? null : DateTime.parse(json["creation_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "userId": userId == null ? null : userId,
    "defaultAddress": defaultAddress == null ? null : defaultAddress,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "address": address == null ? null : address,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "country": country == null ? null : country,
    "zip": zip == null ? null : zip,
    "status": status == null ? null : status,
    "creation_date": creationDate == null ? null : creationDate.toIso8601String(),
  };
}
