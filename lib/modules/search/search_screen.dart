import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/components/article_builder.dart';
import 'package:what_is_happening_app/shared/components/default_text_form_field.dart';
import 'package:what_is_happening_app/shared/components/loading_animation.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
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
                  child: DefaultTextFormField(
                    /*controller: searchController*/ hint: "Search",
                    onChanged: (value) {
                      AppCubit.get(context).getSearch(value);
                    },label: "Search",prefixIcon: Icons.search,
                    controller: searchController,
                    autoFocuse: true,
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
