part of 'show_restaurant_bloc.dart';

@freezed
class ShowRestaurantEvent with _$ShowRestaurantEvent {
  const factory ShowRestaurantEvent.started() = _Started;
  const factory ShowRestaurantEvent.doShow({required int restaurantId}) = _DoShow;
}
