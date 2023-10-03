part of 'show_restaurant_bloc.dart';

@freezed
class ShowRestaurantState with _$ShowRestaurantState {
  const factory ShowRestaurantState.initial() = _Initial;
  const factory ShowRestaurantState.loading() = _Loading;
  const factory ShowRestaurantState.success({required RestaurantResponseModel restaurantData}) = _Success;
  const factory ShowRestaurantState.error({required String error}) = _Error;
}
