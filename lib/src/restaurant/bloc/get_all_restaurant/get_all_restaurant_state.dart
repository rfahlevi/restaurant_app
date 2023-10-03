part of 'get_all_restaurant_bloc.dart';

@freezed
class GetAllRestaurantState with _$GetAllRestaurantState {
  const factory GetAllRestaurantState.initial() = _Initial;
  const factory GetAllRestaurantState.loading() = _Loading;
  const factory GetAllRestaurantState.success({required RestaurantsResponseModel restaurantsData}) = _Success;
  const factory GetAllRestaurantState.error({required String error}) = _Error;
}
