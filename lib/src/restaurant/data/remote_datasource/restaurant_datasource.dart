import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/common/constant.dart';
import 'package:restaurant_app/src/authentication/data/local_datasource/auth_local_datasource.dart';
import 'package:restaurant_app/src/restaurant/data/model/request/add_restaurant_request_model.dart';
import 'package:restaurant_app/src/restaurant/data/model/response/restaurants_response_model.dart';

import '../model/response/restaurant_response_model.dart';

class RestaurantDatasource {
  Future<Either<String, RestaurantsResponseModel>> getRestaurants() async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse('${Constant.baseUrl}/restaurants'),
      headers: headers,
    );

    var statusCode = response.statusCode;
    var data = response.body;

    debugPrint('$statusCode $data');

    if (statusCode == 200) {
      return Right(restaurantsResponseModelFromJson(data));
    } else {
      return Left('Error $statusCode');
    }
  }

  Future<Either<String, RestaurantResponseModel>> addRestaurant(AddRestaurantRequestModel restaurantData) async {
    final token = await AuthLocalDatasource.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = addRestaurantRequestModelToJson(restaurantData);

    var response = await http.post(
      Uri.parse('${Constant.baseUrl}/restaurants'),
      headers: headers,
      body: body,
    );

    var statusCode = response.statusCode;
    var data = response.body;

    debugPrint('$statusCode $data');

    if (statusCode == 200) {
      return Right(restaurantResponseModelFromJson(data));
    }
    return Left('Error $statusCode');
  }

  Future<Either<String, RestaurantResponseModel>> showRestaurant(int restaurantId) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse('${Constant.baseUrl}/restaurants/$restaurantId'),
      headers: headers,
    );

    var statusCode = response.statusCode;
    var data = response.body;

    debugPrint('$statusCode $data');

    if (statusCode == 200) {
      return Right(restaurantResponseModelFromJson(data));
    } else {
      return Left('Error $statusCode');
    }
  }
}
