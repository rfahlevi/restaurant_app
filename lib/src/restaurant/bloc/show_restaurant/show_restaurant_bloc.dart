// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_app/src/restaurant/data/model/response/restaurant_response_model.dart';
import 'package:restaurant_app/src/restaurant/data/repositories/restaurant_repositories.dart';

part 'show_restaurant_bloc.freezed.dart';
part 'show_restaurant_event.dart';
part 'show_restaurant_state.dart';

class ShowRestaurantBloc extends Bloc<ShowRestaurantEvent, ShowRestaurantState> {
  RestaurantRepositories restaurantRepositories;
  ShowRestaurantBloc(
    this.restaurantRepositories,
  ) : super(const _Initial()) {
    on<_DoShow>((event, emit) async {
      emit(const ShowRestaurantState.loading());

      var result = await restaurantRepositories.showRestaurant(event.restaurantId);
      result.fold((l) => emit(ShowRestaurantState.error(error: l)),
          (r) => emit(ShowRestaurantState.success(restaurantData: r)));
    });
  }
}
