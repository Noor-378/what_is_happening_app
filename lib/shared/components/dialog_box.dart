import 'package:flutter/material.dart';
import 'package:what_is_happening_app/shared/components/constants.dart';
import 'package:what_is_happening_app/shared/components/custom_elevated_button.dart';
import 'package:what_is_happening_app/shared/components/default_text_form_field.dart';

class DialogBox extends StatelessWidget {
  // const
  DialogBox({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 25,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child:  Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  profileImage,
                ),
                radius: 40,
              ),
              SizedBox(
                height: 40,
              ),
              DefaultTextFormField(
                hint: "Enter You'r Name",
                label: "Name",
                prefixIcon: Icons.person_outline_rounded,
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                hint: "Enter You'r Email",
                label: "Email",
                prefixIcon: Icons.person_outline_rounded,
                controller: emailController,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      width: 100,
                      height: 35,
                      text: "Cancel",
                    ),
                    CustomElevatedButton(
                      width: 100,
                      height: 35,
                      text: "Save",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
