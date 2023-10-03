import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restaurant_app/src/restaurant/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:restaurant_app/src/restaurant/presentation/widgets/restaurant_list.dart';
import 'package:restaurant_app/theme/alert.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/text_style.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<GetAllRestaurantBloc>().add(const GetAllRestaurantEvent.doGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Places in Reztto!',
                      style: AppTextStyle.blackSemiBold.copyWith(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () => AppAlert.logoutAlert(context),
                      icon: Icon(
                        MdiIcons.logout,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                const RestaurantList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
