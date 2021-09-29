// To parse this JSON data, do
//
//     final similarProductModel = similarProductModelFromJson(jsonString);

import 'dart:convert';

SimilarProductModel similarProductModelFromJson(String str) => SimilarProductModel.fromJson(json.decode(str));

String similarProductModelToJson(SimilarProductModel data) => json.encode(data.toJson());

class SimilarProductModel {
  SimilarProductModel({
    this.responce,
    this.data,
  });

  bool responce;
  List<DatumSimilarProduct> data;

  factory SimilarProductModel.fromJson(Map<String, dynamic> json) => SimilarProductModel(
    responce: json["responce"] == null ? null : json["responce"],
    data: json["data"] == null ? null : List<DatumSimilarProduct>.from(json["data"].map((x) => DatumSimilarProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce == null ? null : responce,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumSimilarProduct {
  DatumSimilarProduct({
    this.productId,
    this.productName,
    this.productImage,
    this.description,
    this.categoryId,
    this.inStock,
    this.price,
    this.unitValue,
    this.unit,
    this.mfgId,
    this.isgeneric,
    this.groupName,
    this.discount,
    this.stock,
    this.title,
    this.mfgName,
  });

  String productId;
  String productName;
  String productImage;
  String description;
  String categoryId;
  String inStock;
  String price;
  String unitValue;
  String unit;
  String mfgId;
  String isgeneric;
  String groupName;
  String discount;
  String stock;
  String title;
  String mfgName;

  factory DatumSimilarProduct.fromJson(Map<String, dynamic> json) => DatumSimilarProduct(
    productId: json["product_id"] == null ? null : json["product_id"],
    productName: json["product_name"] == null ? null : json["product_name"],
    productImage: json["product_image"] == null ? null : json["product_image"],
    description: json["description"] == null ? null : json["description"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    inStock: json["in_stock"] == null ? null : json["in_stock"],
    price: json["price"] == null ? null : json["price"],
    unitValue: json["unit_value"] == null ? null : json["unit_value"],
    unit: json["unit"] == null ? null : json["unit"],
    mfgId: json["mfg_id"] == null ? null : json["mfg_id"],
    isgeneric: json["isgeneric"] == null ? null : json["isgeneric"],
    groupName: json["group_name"] == null ? null : json["group_name"],
    discount: json["discount"] == null ? null : json["discount"],
    stock: json["stock"] == null ? null : json["stock"],
    title: json["title"] == null ? null : json["title"],
    mfgName: json["mfg_name"] == null ? null : json["mfg_name"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId == null ? null : productId,
    "product_name": productName == null ? null : productName,
    "product_image": productImage == null ? null : productImage,
    "description": description == null ? null : description,
    "category_id": categoryId == null ? null : categoryId,
    "in_stock": inStock == null ? null : inStock,
    "price": price == null ? null : price,
    "unit_value": unitValue == null ? null : unitValue,
    "unit": unit == null ? null : unit,
    "mfg_id": mfgId == null ? null : mfgId,
    "isgeneric": isgeneric == null ? null : isgeneric,
    "group_name": groupName == null ? null : groupName,
    "discount": discount == null ? null : discount,
    "stock": stock == null ? null : stock,
    "title": title == null ? null : title,
    "mfg_name": mfgName == null ? null : mfgName,
  };
}
