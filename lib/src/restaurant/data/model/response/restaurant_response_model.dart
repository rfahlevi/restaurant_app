// To parse this JSON data, do
//
//     final restaurantResponseModel = restaurantResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'restaurant_response_model.g.dart';

RestaurantResponseModel restaurantResponseModelFromJson(String str) =>
    RestaurantResponseModel.fromJson(json.decode(str));

String restaurantResponseModelToJson(RestaurantResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class RestaurantResponseModel {
  @JsonKey(name: "data")
  final Data? data;

  RestaurantResponseModel({
    this.data,
  });

  factory RestaurantResponseModel.fromJson(Map<String, dynamic> json) => _$RestaurantResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "attributes")
  final Restaurant? attributes;

  Data({
    this.id,
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Restaurant {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "userId")
  final String? userId;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "publishedAt")
  final DateTime? publishedAt;

  Restaurant({
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.address,
    this.photo,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
