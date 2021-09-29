// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  List<DatumOrder> data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<DatumOrder>.from(json["data"].map((x) => DatumOrder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumOrder {
  DatumOrder({
    this.orderId,
    this.userId,
    this.orderDate,
    this.address,
    this.subtotal,
    this.totalPrice,
    this.paymentMode,
    this.paymentStatus,
    this.orderStatus,
    this.paymentId,
    this.details,
  });

  String orderId;
  String userId;
  DateTime orderDate;
  dynamic address;
  String subtotal;
  String totalPrice;
  String paymentMode;
  String paymentStatus;
  String orderStatus;
  String paymentId;
  List<Detail> details;

  factory DatumOrder.fromJson(Map<String, dynamic> json) => DatumOrder(
    orderId: json["orderId"] == null ? null : json["orderId"],
    userId: json["userId"] == null ? null : json["userId"],
    orderDate: json["orderDate"] == null ? null : DateTime.parse(json["orderDate"]),
    address: json["address"],
    subtotal: json["subtotal"] == null ? null : json["subtotal"],
    totalPrice: json["totalPrice"] == null ? null : json["totalPrice"],
    paymentMode: json["paymentMode"] == null ? null : json["paymentMode"],
    paymentStatus: json["paymentStatus"] == null ? null : json["paymentStatus"],
    orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
    paymentId: json["paymentId"] == null ? null : json["paymentId"],
    details: json["details"] == null ? null : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId == null ? null : orderId,
    "userId": userId == null ? null : userId,
    "orderDate": orderDate == null ? null : orderDate.toIso8601String(),
    "address": address,
    "subtotal": subtotal == null ? null : subtotal,
    "totalPrice": totalPrice == null ? null : totalPrice,
    "paymentMode": paymentMode == null ? null : paymentMode,
    "paymentStatus": paymentStatus == null ? null : paymentStatus,
    "orderStatus": orderStatus == null ? null : orderStatus,
    "paymentId": paymentId == null ? null : paymentId,
    "details": details == null ? null : List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.orderDetailsId,
    this.productId,
    this.price,
    this.quantity,
    this.orderStatus,
  });

  String orderDetailsId;
  String productId;
  String price;
  String quantity;
  String orderStatus;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    orderDetailsId: json["orderDetailsId"] == null ? null : json["orderDetailsId"],
    productId: json["productId"] == null ? null : json["productId"],
    price: json["price"] == null ? null : json["price"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
  );

  Map<String, dynamic> toJson() => {
    "orderDetailsId": orderDetailsId == null ? null : orderDetailsId,
    "productId": productId == null ? null : productId,
    "price": price == null ? null : price,
    "quantity": quantity == null ? null : quantity,
    "orderStatus": orderStatus == null ? null : orderStatus,
  };
}
