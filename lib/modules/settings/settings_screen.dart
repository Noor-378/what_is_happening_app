import 'package:flutter/material.dart';
import 'package:what_is_happening_app/shared/components/constants.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
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
              "test@gmail.com",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15,
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).changeAppMode();
              },
              icon: Icon(
                Icons.wb_sunny_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
