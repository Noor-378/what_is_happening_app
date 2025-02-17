import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/components/custom_bottom_nav_bar.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "News App",
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            floatingActionButton: CustomBottomNavBar(cubit: cubit),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
