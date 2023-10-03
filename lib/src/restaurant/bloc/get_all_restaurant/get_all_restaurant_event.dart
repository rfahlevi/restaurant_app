part of 'get_all_restaurant_bloc.dart';

@freezed
class GetAllRestaurantEvent with _$GetAllRestaurantEvent {
  const factory GetAllRestaurantEvent.started() = _Started;
  const factory GetAllRestaurantEvent.doGet() = _DoGet;
}
