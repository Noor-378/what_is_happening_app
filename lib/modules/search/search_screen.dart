import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/components/article_builder.dart';
import 'package:what_is_happening_app/shared/components/loading_animation.dart';
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
          var list = AppCubit.get(context).search;
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
                  child: TextField(
                    
                    style: Theme.of(context).textTheme.labelMedium,
                    focusNode: focusNode,
                    autofocus: true,
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.blue,
                    onChanged: (value) {
                      AppCubit.get(context).getSearch(value);
                    },
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
                      prefixIconColor: Colors.blue,
                      labelText: "Search",
                      floatingLabelStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                list.length == 0
                    ? Expanded(child: LoadingAnimation())
                    : Expanded(child: ArticleBuilder(list: list))
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
