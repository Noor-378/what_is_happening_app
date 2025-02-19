import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/components/custom_bottom_nav_bar.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';
import 'package:what_is_happening_app/shared/styles/dark_theme.dart';
import 'package:what_is_happening_app/shared/styles/light_theme.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);


        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "News App",
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon:  Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.errorContainer,
                  ),
                ),
              ],
            ),
            floatingActionButton: CustomBottomNavBar(cubit: cubit),
            body: cubit.screens[cubit.currentIndex],
          ),
        );
      },
    );
  }
}
