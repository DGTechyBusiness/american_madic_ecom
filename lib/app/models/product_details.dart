// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.data,
    this.extensions,
  });

  ProductDetailsData data;
  Extensions extensions;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    data: json["data"] == null ? null : ProductDetailsData.fromJson(json["data"]),
    extensions: json["extensions"] == null ? null : Extensions.fromJson(json["extensions"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "extensions": extensions == null ? null : extensions.toJson(),
  };
}

class ProductDetailsData {
  ProductDetailsData({
    this.product,
  });

  Product product;

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) => ProductDetailsData(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product == null ? null : product.toJson(),
  };
}

class Product {
  Product({
    this.createdAt,
    this.defaultCursor,
    this.description,
    this.descriptionHtml,
    this.featuredImage,
    this.feedback,
    this.giftCardTemplateSuffix,
    this.handle,
    this.hasOnlyDefaultVariant,
    this.hasOutOfStockVariants,
    this.id,
    this.images,
    this.onlineStorePreviewUrl,
    this.onlineStoreUrl,
    this.options,
    this.priceRange,
    this.productType,
    this.publishedAt,
    this.tags,
    this.templateSuffix,
    this.title,
    this.totalInventory,
    this.totalVariants,
    this.tracksInventory,
    this.updatedAt,
    this.variants,
    this.vendor,
  });

  DateTime createdAt;
  String defaultCursor;
  String description;
  String descriptionHtml;
  FeaturedImage featuredImage;
  Feedback feedback;
  String giftCardTemplateSuffix;
  String handle;
  bool hasOnlyDefaultVariant;
  bool hasOutOfStockVariants;
  String id;
  Images images;
  String onlineStorePreviewUrl;
  String onlineStoreUrl;
  List<Option> options;
  PriceRange priceRange;
  String productType;
  DateTime publishedAt;
  List<dynamic> tags;
  String templateSuffix;
  String title;
  int totalInventory;
  int totalVariants;
  bool tracksInventory;
  DateTime updatedAt;
  Variants variants;
  String vendor;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    defaultCursor: json["defaultCursor"] == null ? null : json["defaultCursor"],
    description: json["description"] == null ? null : json["description"],
    descriptionHtml: json["descriptionHtml"] == null ? null : json["descriptionHtml"],
    featuredImage: json["featuredImage"] == null ? null : FeaturedImage.fromJson(json["featuredImage"]),
    feedback: json["feedback"] == null ? null : Feedback.fromJson(json["feedback"]),
    giftCardTemplateSuffix: json["giftCardTemplateSuffix"] == null ? null : json["giftCardTemplateSuffix"],
    handle: json["handle"] == null ? null : json["handle"],
    hasOnlyDefaultVariant: json["hasOnlyDefaultVariant"] == null ? null : json["hasOnlyDefaultVariant"],
    hasOutOfStockVariants: json["hasOutOfStockVariants"] == null ? null : json["hasOutOfStockVariants"],
    id: json["id"] == null ? null : json["id"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    onlineStorePreviewUrl: json["onlineStorePreviewUrl"] == null ? null : json["onlineStorePreviewUrl"],
    onlineStoreUrl: json["onlineStoreUrl"] == null ? null : json["onlineStoreUrl"],
    options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    priceRange: json["priceRange"] == null ? null : PriceRange.fromJson(json["priceRange"]),
    productType: json["productType"] == null ? null : json["productType"],
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
    templateSuffix: json["templateSuffix"] == null ? null : json["templateSuffix"],
    title: json["title"] == null ? null : json["title"],
    totalInventory: json["totalInventory"] == null ? null : json["totalInventory"],
    totalVariants: json["totalVariants"] == null ? null : json["totalVariants"],
    tracksInventory: json["tracksInventory"] == null ? null : json["tracksInventory"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    variants: json["variants"] == null ? null : Variants.fromJson(json["variants"]),
    vendor: json["vendor"] == null ? null : json["vendor"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "defaultCursor": defaultCursor == null ? null : defaultCursor,
    "description": description == null ? null : description,
    "descriptionHtml": descriptionHtml == null ? null : descriptionHtml,
    "featuredImage": featuredImage == null ? null : featuredImage.toJson(),
    "feedback": feedback == null ? null : feedback.toJson(),
    "giftCardTemplateSuffix": giftCardTemplateSuffix == null ? null : giftCardTemplateSuffix,
    "handle": handle == null ? null : handle,
    "hasOnlyDefaultVariant": hasOnlyDefaultVariant == null ? null : hasOnlyDefaultVariant,
    "hasOutOfStockVariants": hasOutOfStockVariants == null ? null : hasOutOfStockVariants,
    "id": id == null ? null : id,
    "images": images == null ? null : images.toJson(),
    "onlineStorePreviewUrl": onlineStorePreviewUrl == null ? null : onlineStorePreviewUrl,
    "onlineStoreUrl": onlineStoreUrl == null ? null : onlineStoreUrl,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toJson())),
    "priceRange": priceRange == null ? null : priceRange.toJson(),
    "productType": productType == null ? null : productType,
    "publishedAt": publishedAt == null ? null : publishedAt.toIso8601String(),
    "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
    "templateSuffix": templateSuffix == null ? null : templateSuffix,
    "title": title == null ? null : title,
    "totalInventory": totalInventory == null ? null : totalInventory,
    "totalVariants": totalVariants == null ? null : totalVariants,
    "tracksInventory": tracksInventory == null ? null : tracksInventory,
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "variants": variants == null ? null : variants.toJson(),
    "vendor": vendor == null ? null : vendor,
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

class Feedback {
  Feedback({
    this.details,
  });

  List<Detail> details;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
    details: json["details"] == null ? null : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "details": details == null ? null : List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.messages,
  });

  List<Message> messages;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    messages: json["messages"] == null ? null : List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messages": messages == null ? null : List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.message,
  });

  String message;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
  };
}

class Images {
  Images({
    this.edges,
  });

  List<ImagesEdge> edges;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    edges: json["edges"] == null ? null : List<ImagesEdge>.from(json["edges"].map((x) => ImagesEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": edges == null ? null : List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class ImagesEdge {
  ImagesEdge({
    this.node,
  });

  FeaturedImage node;

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
    node: json["node"] == null ? null : FeaturedImage.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node == null ? null : node.toJson(),
  };
}

class Option {
  Option({
    this.name,
  });

  String name;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };
}

class PriceRange {
  PriceRange({
    this.maxVariantPrice,
    this.minVariantPrice,
  });

  VariantPrice maxVariantPrice;
  VariantPrice minVariantPrice;

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
    maxVariantPrice: json["maxVariantPrice"] == null ? null : VariantPrice.fromJson(json["maxVariantPrice"]),
    minVariantPrice: json["minVariantPrice"] == null ? null : VariantPrice.fromJson(json["minVariantPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "maxVariantPrice": maxVariantPrice == null ? null : maxVariantPrice.toJson(),
    "minVariantPrice": minVariantPrice == null ? null : minVariantPrice.toJson(),
  };
}

class VariantPrice {
  VariantPrice({
    this.amount,
  });

  String amount;

  factory VariantPrice.fromJson(Map<String, dynamic> json) => VariantPrice(
    amount: json["amount"] == null ? null : json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
  };
}

class Variants {
  Variants({
    this.edges,
  });

  List<VariantsEdge> edges;

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
    edges: json["edges"] == null ? null : List<VariantsEdge>.from(json["edges"].map((x) => VariantsEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": edges == null ? null : List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class VariantsEdge {
  VariantsEdge({
    this.node,
  });

  Node node;

  factory VariantsEdge.fromJson(Map<String, dynamic> json) => VariantsEdge(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node == null ? null : node.toJson(),
  };
}

class Node {
  Node({
    this.displayName,
    this.price,
  });

  String displayName;
  String price;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    displayName: json["displayName"] == null ? null : json["displayName"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "displayName": displayName == null ? null : displayName,
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
