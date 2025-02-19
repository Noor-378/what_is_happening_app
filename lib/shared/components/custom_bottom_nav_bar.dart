import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 25,
            ),
          ],
        ),
        child: GNav(
          gap: 3,
          color: Colors.black45,
          activeColor: Colors.blue,
          tabActiveBorder: Border.all(color: Colors.blue, width: 1.5),
          tabBackgroundColor: Colors.black12,
          tabBorderRadius: 25,
          rippleColor: Colors.lightBlue,
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          tabs: cubit.bottomNavItems,
          onTabChange: (index) {
            cubit.changeBottomNavBar(index);
          },
        ),
      ),
    );
  }
}
