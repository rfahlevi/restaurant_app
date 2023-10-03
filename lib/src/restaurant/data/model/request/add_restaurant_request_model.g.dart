// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_restaurant_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRestaurantRequestModel _$AddRestaurantRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddRestaurantRequestModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddRestaurantRequestModelToJson(
        AddRestaurantRequestModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      description: json['description'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      photo: json['photo'] as String?,
      address: json['address'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'photo': instance.photo,
      'address': instance.address,
      'userId': instance.userId,
    };
