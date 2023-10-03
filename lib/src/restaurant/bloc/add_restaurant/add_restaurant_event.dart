part of 'add_restaurant_bloc.dart';

@freezed
class AddRestaurantEvent with _$AddRestaurantEvent {
  const factory AddRestaurantEvent.started() = _Started;
  const factory AddRestaurantEvent.doGet({required AddRestaurantRequestModel restaurantData}) = _DoGet;
}
