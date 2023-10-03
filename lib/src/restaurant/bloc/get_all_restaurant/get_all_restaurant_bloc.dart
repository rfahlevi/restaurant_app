// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_app/src/restaurant/data/model/response/restaurants_response_model.dart';
import 'package:restaurant_app/src/restaurant/data/repositories/restaurant_repositories.dart';

part 'get_all_restaurant_bloc.freezed.dart';
part 'get_all_restaurant_event.dart';
part 'get_all_restaurant_state.dart';

class GetAllRestaurantBloc extends Bloc<GetAllRestaurantEvent, GetAllRestaurantState> {
  final RestaurantRepositories restaurantRepositories;
  GetAllRestaurantBloc(
    this.restaurantRepositories,
  ) : super(const _Initial()) {
    on<_DoGet>((event, emit) async {
      emit(const GetAllRestaurantState.loading());

      var result = await restaurantRepositories.getAllRestaurant();
      result.fold((l) => emit(GetAllRestaurantState.error(error: l)),
          (r) => emit(GetAllRestaurantState.success(restaurantsData: r)));
    });
  }
}
