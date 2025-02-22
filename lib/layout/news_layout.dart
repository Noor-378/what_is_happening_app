import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/modules/search/search_screen.dart';
import 'package:what_is_happening_app/shared/components/custom_bottom_nav_bar.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

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
                  onPressed: () {
                    cubit.navigateTo(
                      context,
                      SearchScreen(),
                    );
                  },
                  icon: Icon(
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
