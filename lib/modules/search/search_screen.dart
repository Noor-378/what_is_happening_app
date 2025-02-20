import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    FocusNode focusNode = FocusNode();

    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    focusNode: focusNode,
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.blue,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "search must not be empty";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: borderForTextFormField(
                        context,
                        Colors.grey,
                      ),
                      focusedBorder: borderForTextFormField(
                        context,
                        Colors.blue,
                      ),
                      prefixIconColor:
                          focusNode.hasFocus ? Colors.blue : Colors.grey,
                      labelText: "Search",
                      floatingLabelStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppCubit.get(context).changeColor(focusNode),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

OutlineInputBorder borderForTextFormField(context, Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      width: 2.5,
      color: color,
    ),
  );
}
