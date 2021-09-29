// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  ProductListModel({
    this.data,
    this.extensions,
  });

  Data data;
  Extensions extensions;

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
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
    this.collection,
  });

  Collection collection;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    collection: json["collection"] == null ? null : Collection.fromJson(json["collection"]),
  );

  Map<String, dynamic> toJson() => {
    "collection": collection == null ? null : collection.toJson(),
  };
}

class Collection {
  Collection({
    this.products,
  });

  Products products;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    products: json["products"] == null ? null : Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? null : products.toJson(),
  };
}

class Products {
  Products({
    this.pageInfo,
    this.edges,
  });

  PageInfo pageInfo;
  List<ProductsEdge> edges;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    edges: json["edges"] == null ? null : List<ProductsEdge>.from(json["edges"].map((x) => ProductsEdge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageInfo": pageInfo == null ? null : pageInfo.toJson(),
    "edges": edges == null ? null : List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class ProductsEdge {
  ProductsEdge({
    this.cursor,
    this.node,
  });

  String cursor;
  PurpleNode node;

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
    cursor: json["cursor"] == null ? null : json["cursor"],
    node: json["node"] == null ? null : PurpleNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "cursor": cursor == null ? null : cursor,
    "node": node == null ? null : node.toJson(),
  };
}

class PurpleNode {
  PurpleNode({
    this.variants,
  });

  Variants variants;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
    variants: json["variants"] == null ? null : Variants.fromJson(json["variants"]),
  );

  Map<String, dynamic> toJson() => {
    "variants": variants == null ? null : variants.toJson(),
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

  FluffyNode node;

  factory VariantsEdge.fromJson(Map<String, dynamic> json) => VariantsEdge(
    node: json["node"] == null ? null : FluffyNode.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node == null ? null : node.toJson(),
  };
}

class FluffyNode {
  FluffyNode({
    this.product,
    this.sku,
    this.price,
    this.inventoryQuantity,
  });

  Product product;
  String sku;
  String price;
  int inventoryQuantity;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    sku: json["sku"] == null ? null : json["sku"],
    price: json["price"] == null ? null : json["price"],
    inventoryQuantity: json["inventoryQuantity"] == null ? null : json["inventoryQuantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": product == null ? null : product.toJson(),
    "sku": sku == null ? null : sku,
    "price": price == null ? null : price,
    "inventoryQuantity": inventoryQuantity == null ? null : inventoryQuantity,
  };
}

class Product {
  Product({
    this.id,
    this.title,
    this.featuredImage,
  });

  String id;
  String title;
  FeaturedImage featuredImage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    featuredImage: json["featuredImage"] == null ? null : FeaturedImage.fromJson(json["featuredImage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "featuredImage": featuredImage == null ? null : featuredImage.toJson(),
  };
}

class FeaturedImage {
  FeaturedImage({
    this.originalSrc,
  });

  String originalSrc;

  factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
    originalSrc: json["originalSrc"] == null ? null : json["originalSrc"],
  );

  Map<String, dynamic> toJson() => {
    "originalSrc": originalSrc == null ? null : originalSrc,
  };
}

class PageInfo {
  PageInfo({
    this.hasNextPage,
    this.hasPreviousPage,
  });

  bool hasNextPage;
  bool hasPreviousPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    hasNextPage: json["hasNextPage"] == null ? null : json["hasNextPage"],
    hasPreviousPage: json["hasPreviousPage"] == null ? null : json["hasPreviousPage"],
  );

  Map<String, dynamic> toJson() => {
    "hasNextPage": hasNextPage == null ? null : hasNextPage,
    "hasPreviousPage": hasPreviousPage == null ? null : hasPreviousPage,
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
