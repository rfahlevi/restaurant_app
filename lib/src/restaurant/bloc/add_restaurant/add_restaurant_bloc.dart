// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/src/restaurant/data/model/request/add_restaurant_request_model.dart';
import 'package:restaurant_app/src/restaurant/data/model/response/restaurant_response_model.dart';
import 'package:restaurant_app/src/restaurant/data/repositories/restaurant_repositories.dart';
part 'add_restaurant_bloc.freezed.dart';
part 'add_restaurant_event.dart';
part 'add_restaurant_state.dart';

class AddRestaurantBloc extends Bloc<AddRestaurantEvent, AddRestaurantState> {
  RestaurantRepositories restaurantRepositories;
  AddRestaurantBloc(
    this.restaurantRepositories,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const AddRestaurantState.loading());

      var result = await restaurantRepositories.addRestaurant(event.restaurantData);
      result.fold(
        (l) => emit(AddRestaurantState.error(error: l)),
        (r) => emit(AddRestaurantState.success(restaurantsData: r)),
      );
    });
  }
}
