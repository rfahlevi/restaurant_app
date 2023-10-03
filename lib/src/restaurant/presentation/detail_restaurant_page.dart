// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restaurant_app/src/restaurant/bloc/show_restaurant/show_restaurant_bloc.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/text_style.dart';

class DetailRestaurantPage extends StatefulWidget {
  static const routeName = '/detail-restaurant';
  final int restaurantId;
  const DetailRestaurantPage({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  void initState() {
    context.read<ShowRestaurantBloc>().add(ShowRestaurantEvent.doShow(restaurantId: widget.restaurantId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShowRestaurantBloc, ShowRestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (restaurantData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 10,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            child: FadeInImage(
                              placeholder: const AssetImage('assets/img_placeholder.png'),
                              image: NetworkImage(restaurantData.data!.attributes!.photo!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: () => context.pop(),
                                splashColor: AppColors.black,
                                child: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppColors.white.withOpacity(0.7),
                                  ),
                                  child: Icon(
                                    MdiIcons.arrowLeft,
                                    color: AppColors.black,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurantData.data!.attributes!.name!,
                            style: AppTextStyle.blackSemiBold.copyWith(fontSize: 18),
                          ),
                          Text(
                            restaurantData.data!.attributes!.description!,
                            style: AppTextStyle.greyRegular,
                          ),
                          Text(
                            restaurantData.data!.attributes!.address!,
                            style: AppTextStyle.greyRegular,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
