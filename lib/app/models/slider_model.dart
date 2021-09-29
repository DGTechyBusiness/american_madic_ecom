// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.responce,
    this.data,
  });

  bool responce;
  List<DatumSlider> data;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    responce: json["responce"] == null ? null : json["responce"],
    data: json["data"] == null ? null : List<DatumSlider>.from(json["data"].map((x) => DatumSlider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responce": responce == null ? null : responce,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumSlider {
  DatumSlider({
    this.id,
    this.sliderTitle,
    this.sliderUrl,
    this.sliderImage,
    this.sliderStatus,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.draft,
  });

  String id;
  String sliderTitle;
  String sliderUrl;
  String sliderImage;
  String sliderStatus;
  String createdAt;
  String createdBy;
  String modifiedAt;
  String modifiedBy;
  String draft;

  factory DatumSlider.fromJson(Map<String, dynamic> json) => DatumSlider(
    id: json["id"] == null ? null : json["id"],
    sliderTitle: json["slider_title"] == null ? null : json["slider_title"],
    sliderUrl: json["slider_url"] == null ? null : json["slider_url"],
    sliderImage: json["slider_image"] == null ? null : json["slider_image"],
    sliderStatus: json["slider_status"] == null ? null : json["slider_status"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    modifiedAt: json["modified_at"] == null ? null : json["modified_at"],
    modifiedBy: json["modified_by"] == null ? null : json["modified_by"],
    draft: json["draft"] == null ? null : json["draft"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "slider_title": sliderTitle == null ? null : sliderTitle,
    "slider_url": sliderUrl == null ? null : sliderUrl,
    "slider_image": sliderImage == null ? null : sliderImage,
    "slider_status": sliderStatus == null ? null : sliderStatus,
    "created_at": createdAt == null ? null : createdAt,
    "created_by": createdBy == null ? null : createdBy,
    "modified_at": modifiedAt == null ? null : modifiedAt,
    "modified_by": modifiedBy == null ? null : modifiedBy,
    "draft": draft == null ? null : draft,
  };
}
