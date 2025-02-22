import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/model/user_preferences.dart';
import 'package:what_is_happening_app/shared/components/constants.dart';
import 'package:what_is_happening_app/shared/components/custom_elevated_button.dart';
import 'package:what_is_happening_app/shared/components/dialog_box.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      
      listener: (context, state) {},
      builder: (context, state) {
        
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              top: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    profileImage,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                //  UserPreferences.myUser.name,
                "Noor Alawawdeh",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                //  UserPreferences.myUser.email,
                "gmail@gmail.com",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                CustomElevatedButton(
                  width: 150,
                  height: 35,
                  text: "Edit Profile",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogBox();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change Theme",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      IconButton(
                        icon: Icon(
                          AppCubit.get(context).changeIconTheme(),
                          color: Theme.of(context).colorScheme.errorContainer,
                        ),
                        onPressed: () {
                          AppCubit.get(context).changeAppMode();
                        },
                      )
                    ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
