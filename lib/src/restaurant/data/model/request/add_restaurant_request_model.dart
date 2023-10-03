// To parse this JSON data, do
//
//     final addRestaurantRequestModel = addRestaurantRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'add_restaurant_request_model.g.dart';

AddRestaurantRequestModel addRestaurantRequestModelFromJson(String str) =>
    AddRestaurantRequestModel.fromJson(json.decode(str));

String addRestaurantRequestModelToJson(AddRestaurantRequestModel data) => json.encode(data.toJson());

@JsonSerializable()
class AddRestaurantRequestModel {
  @JsonKey(name: "data")
  final Data? data;

  AddRestaurantRequestModel({
    this.data,
  });

  factory AddRestaurantRequestModel.fromJson(Map<String, dynamic> json) => _$AddRestaurantRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddRestaurantRequestModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "latitude")
  final String? latitude;
  @JsonKey(name: "longitude")
  final String? longitude;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "userId")
  final int? userId;

  Data({
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.photo,
    this.address,
    this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
