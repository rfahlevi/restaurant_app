part of 'add_restaurant_bloc.dart';

@freezed
class AddRestaurantState with _$AddRestaurantState {
  const factory AddRestaurantState.initial() = _Initial;
  const factory AddRestaurantState.loading() = _Loading;
  const factory AddRestaurantState.success({required RestaurantResponseModel restaurantsData}) = _Success;
  const factory AddRestaurantState.error({required String error}) = _Error;
}
