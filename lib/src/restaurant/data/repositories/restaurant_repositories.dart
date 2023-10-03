import 'package:dartz/dartz.dart';
import 'package:restaurant_app/src/restaurant/data/model/request/add_restaurant_request_model.dart';
import 'package:restaurant_app/src/restaurant/data/model/response/restaurant_response_model.dart';
import 'package:restaurant_app/src/restaurant/data/model/response/restaurants_response_model.dart';
import 'package:restaurant_app/src/restaurant/data/remote_datasource/restaurant_datasource.dart';

class RestaurantRepositories {
  final _restaurantDatasource = RestaurantDatasource();

  Future<Either<String, RestaurantsResponseModel>> getAllRestaurant() async {
    return _restaurantDatasource.getRestaurants();
  }

  Future<Either<String, RestaurantResponseModel>> addRestaurant(AddRestaurantRequestModel restaurantData) async {
    return _restaurantDatasource.addRestaurant(restaurantData);
  }

  Future<Either<String, RestaurantResponseModel>> showRestaurant(int restaurantId) async {
    return _restaurantDatasource.showRestaurant(restaurantId);
  }
}
