// To parse this JSON data, do
//
//     final wishListProductModel = wishListProductModelFromJson(jsonString);

import 'dart:convert';

WishListProductModel wishListProductModelFromJson(String str) => WishListProductModel.fromJson(json.decode(str));

String wishListProductModelToJson(WishListProductModel data) => json.encode(data.toJson());

class WishListProductModel {
  WishListProductModel({
    this.status,
    this.list,
    this.message,
  });

  int status;
  List<ListElement> list;
  String message;

  factory WishListProductModel.fromJson(Map<String, dynamic> json) => WishListProductModel(
    status: json["status"] == null ? null : json["status"],
    list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
    "message": message == null ? null : message,
  };
}

class ListElement {
  ListElement({
    this.data,
    this.extensions,
  });

  Data data;
  Extensions extensions;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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

  Product product;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product == null ? null : product.toJson(),
  };
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
