// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) => json.encode(data.toJson());

class CategoryListModel {
  CategoryListModel({
    this.data,
    this.extensions,
  });

  Data data;
  Extensions extensions;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
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
    this.collections,
  });

  Collections collections;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    collections: json["collections"] == null ? null : Collections.fromJson(json["collections"]),
  );

  Map<String, dynamic> toJson() => {
    "collections": collections == null ? null : collections.toJson(),
  };
}

class Collections {
  Collections({
    this.edges,
  });

  List<Edge> edges;

  factory Collections.fromJson(Map<String, dynamic> json) => Collections(
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
    this.id,
    this.title,
    this.image,
  });

  String id;
  String title;
  Image image;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "image": image == null ? null : image.toJson(),
  };
}

class Image {
  Image({
    this.originalSrc,
  });

  String originalSrc;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    originalSrc: json["originalSrc"] == null ? null : json["originalSrc"],
  );

  Map<String, dynamic> toJson() => {
    "originalSrc": originalSrc == null ? null : originalSrc,
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

  double maximumAvailable;
  int currentlyAvailable;
  double restoreRate;

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
