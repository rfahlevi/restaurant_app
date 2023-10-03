import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restaurant_app/src/restaurant/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:restaurant_app/src/restaurant/presentation/detail_restaurant_page.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/text_style.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            );
          },
          success: (restaurantsData) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 7,
                crossAxisSpacing: 12,
                childAspectRatio: 4 / 5,
              ),
              itemCount: restaurantsData.data?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context.push(Uri(
                      path: DetailRestaurantPage.routeName,
                      queryParameters: {'restaurantId': restaurantsData.data?[index].id.toString()}).toString()),
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 7),
                        height: 120,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FadeInImage(
                            placeholder: const AssetImage('assets/img_placeholder.png'),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Icon(
                                MdiIcons.alertBox,
                                color: AppColors.grey,
                              );
                            },
                            image: NetworkImage(
                              restaurantsData.data![index].attributes!.photo!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        restaurantsData.data![index].attributes!.name!,
                        style: AppTextStyle.blackMedium.copyWith(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        restaurantsData.data![index].attributes!.description!,
                        style: AppTextStyle.greyRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        restaurantsData.data![index].attributes!.address!,
                        style: AppTextStyle.greyRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
