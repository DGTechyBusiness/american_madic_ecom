// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  CartListModel({
    this.status,
    this.message,
    this.count,
    this.list,
    this.total,
  });

  int status;
  String message;
  int count;
  List<ListElement> list;
  double total;

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    count: json["count"] == null ? null : json["count"],
    list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    total: json["total"] == null ? null : json["total"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "count": count == null ? null : count,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
    "total": total == null ? null : total,
  };
}

class ListElement {
  ListElement({
    this.product,
    this.cartId,
    this.quantity,
    this.totalPrice,
    this.price,
  });

  ListProduct product;
  String cartId;
  String quantity;
  String totalPrice;
  String price;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    product: json["product"] == null ? null : ListProduct.fromJson(json["product"]),
    cartId: json["cart_id"] == null ? null : json["cart_id"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "product": product == null ? null : product.toJson(),
    "cart_id": cartId == null ? null : cartId,
    "quantity": quantity == null ? null : quantity,
    "total_price": totalPrice == null ? null : totalPrice,
    "price": price == null ? null : price,
  };
}

class ListProduct {
  ListProduct({
    this.data,
    this.extensions,
  });

  Data data;
  Extensions extensions;

  factory ListProduct.fromJson(Map<String, dynamic> json) => ListProduct(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    extensions: json["extensions"] == null ? null : Extensions.fromJson(json["extensions"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "extensions": extensions == null ? null : extensions.toJson(),
  };
}

class Data {
  Data({
    this.product,
  });

  DataProduct product;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    product: json["product"] == null ? null : DataProduct.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product == null ? null : product.toJson(),
  };
}

class DataProduct {
  DataProduct({
    this.featuredImage,
    this.id,
    this.title,
    this.totalInventory,
    this.variants,
  });

  FeaturedImage featuredImage;
  String id;
  String title;
  int totalInventory;
  Variants variants;

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
    featuredImage: json["featuredImage"] == null ? null : FeaturedImage.fromJson(json["featuredImage"]),
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    totalInventory: json["totalInventory"] == null ? null : json["totalInventory"],
    variants: json["variants"] == null ? null : Variants.fromJson(json["variants"]),
  );

  Map<String, dynamic> toJson() => {
    "featuredImage": featuredImage == null ? null : featuredImage.toJson(),
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "totalInventory": totalInventory == null ? null : totalInventory,
    "variants": variants == null ? null : variants.toJson(),
  };
}

class FeaturedImage {
  FeaturedImage({
    this.id,
    this.originalSrc,
  });

  String id;
  String originalSrc;

  factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
    id: json["id"] == null ? null : json["id"],
    originalSrc: json["originalSrc"] == null ? null : json["originalSrc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "originalSrc": originalSrc == null ? null : originalSrc,
  };
}

class Variants {
  Variants({
    this.edges,
  });

  List<Edge> edges;

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
    edges: json["edges"] == null ? null : List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": edges == null ? null : List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class Edge {
  Edge({
    this.node,
  });

  Node node;

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node == null ? null : node.toJson(),
  };
}

class Node {
  Node({
    this.price,
  });

  String price;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "price": price == null ? null : price,
  };
}

class Extensions {
  Extensions({
    this.cost,
  });

  Cost cost;

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions(
    cost: json["cost"] == null ? null : Cost.fromJson(json["cost"]),
  );

  Map<String, dynamic> toJson() => {
    "cost": cost == null ? null : cost.toJson(),
  };
}

class Cost {
  Cost({
    this.requestedQueryCost,
    this.actualQueryCost,
    this.throttleStatus,
  });

  int requestedQueryCost;
  int actualQueryCost;
  ThrottleStatus throttleStatus;

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
    requestedQueryCost: json["requestedQueryCost"] == null ? null : json["requestedQueryCost"],
    actualQueryCost: json["actualQueryCost"] == null ? null : json["actualQueryCost"],
    throttleStatus: json["throttleStatus"] == null ? null : ThrottleStatus.fromJson(json["throttleStatus"]),
  );

  Map<String, dynamic> toJson() => {
    "requestedQueryCost": requestedQueryCost == null ? null : requestedQueryCost,
    "actualQueryCost": actualQueryCost == null ? null : actualQueryCost,
    "throttleStatus": throttleStatus == null ? null : throttleStatus.toJson(),
  };
}

class ThrottleStatus {
  ThrottleStatus({
    this.maximumAvailable,
    this.currentlyAvailable,
    this.restoreRate,
  });

  int maximumAvailable;
  int currentlyAvailable;
  int restoreRate;

  factory ThrottleStatus.fromJson(Map<String, dynamic> json) => ThrottleStatus(
    maximumAvailable: json["maximumAvailable"] == null ? null : json["maximumAvailable"],
    currentlyAvailable: json["currentlyAvailable"] == null ? null : json["currentlyAvailable"],
    restoreRate: json["restoreRate"] == null ? null : json["restoreRate"],
  );

  Map<String, dynamic> toJson() => {
    "maximumAvailable": maximumAvailable == null ? null : maximumAvailable,
    "currentlyAvailable": currentlyAvailable == null ? null : currentlyAvailable,
    "restoreRate": restoreRate == null ? null : restoreRate,
  };
}
