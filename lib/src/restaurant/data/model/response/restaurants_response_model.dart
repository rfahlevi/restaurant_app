// To parse this JSON data, do
//
//     final restaurantsResponseModel = restaurantsResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:restaurant_app/src/restaurant/data/model/response/restaurant_response_model.dart';

part 'restaurants_response_model.g.dart';

RestaurantsResponseModel restaurantsResponseModelFromJson(String str) =>
    RestaurantsResponseModel.fromJson(json.decode(str));

String restaurantsResponseModelToJson(RestaurantsResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class RestaurantsResponseModel {
  @JsonKey(name: "data")
  final List<Datum>? data;
  @JsonKey(name: "meta")
  final Meta? meta;

  RestaurantsResponseModel({
    this.data,
    this.meta,
  });

  factory RestaurantsResponseModel.fromJson(Map<String, dynamic> json) => _$RestaurantsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "attributes")
  final Restaurant? attributes;

  Datum({
    this.id,
    this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "pagination")
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "pageSize")
  final int? pageSize;
  @JsonKey(name: "pageCount")
  final int? pageCount;
  @JsonKey(name: "total")
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
