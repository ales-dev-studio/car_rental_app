import 'package:car_rental_app/core/gen/assets.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/core/theme/dimens.dart';
import 'package:car_rental_app/core/widgets/app_svg_viewer.dart';
import 'package:car_rental_app/features/home_feature/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/main_app_bar.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/tabs/history_tab.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/tabs/home_tab.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/tabs/profile_tab.dart';
import 'package:car_rental_app/features/home_feature/presentation/widgets/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationCubit>(
      create: (context) => BottomNavigationCubit(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BottomNavigationCubit>();
    final read = context.read<BottomNavigationCubit>();

    final List<Widget> tabs = [
      const HomeTab(),
      const SearchTab(),
      const HistoryTab(),
      const ProfileTab(),
    ];

    return Scaffold(
      appBar: const MainAppBar(),
      body: tabs[watch.state.selectedIndex],
      bottomNavigationBar: ColoredBox(
        color: AppColors.backgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.corners * 2),
          child: BottomNavigationBar(
            backgroundColor: AppColors.cardColor,
            currentIndex: watch.state.selectedIndex,
            onTap: (final int index) {
              read.onItemTap(index: index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.whiteColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.largePadding,
                  ),
                  child: AppSvgViewer(
                    Assets.icons.home,
                    color: watch.state.selectedIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(
                    top: Dimens.padding,
                    bottom: Dimens.largePadding,
                  ),
                  child: AppSvgViewer(
                    Assets.icons.search,
                    color: watch.state.selectedIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                  ),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(
                    top: Dimens.padding,
                    bottom: Dimens.largePadding,
                  ),
                  child: AppSvgViewer(
                    Assets.icons.history,
                    color: watch.state.selectedIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                  ),
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(
                    top: Dimens.padding,
                    bottom: Dimens.largePadding,
                  ),
                  child: AppSvgViewer(
                    Assets.icons.user,
                    color: watch.state.selectedIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
