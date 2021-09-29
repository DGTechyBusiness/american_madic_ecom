// To parse this JSON data, do
//
//     final recentViewModel = recentViewModelFromJson(jsonString);

import 'dart:convert';

RecentViewModel recentViewModelFromJson(String str) => RecentViewModel.fromJson(json.decode(str));

String recentViewModelToJson(RecentViewModel data) => json.encode(data.toJson());

class RecentViewModel {
  RecentViewModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<RecentDatum> data;

  factory RecentViewModel.fromJson(Map<String, dynamic> json) => RecentViewModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<RecentDatum>.from(json["data"].map((x) => RecentDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class RecentDatum {
  RecentDatum({
    this.id,
    this.productId,
    this.userId,
    this.date,
    this.image,
    this.name,
    this.price,
    this.stock,
  });

  String id;
  String productId;
  String userId;
  DateTime date;
  String image;
  String name;
  String price;
  String stock;

  factory RecentDatum.fromJson(Map<String, dynamic> json) => RecentDatum(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    stock: json["stock"] == null ? null : json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "user_id": userId == null ? null : userId,
    "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "image": image == null ? null : image,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "stock": stock == null ? null : stock,
  };
}
