import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_is_happening_app/shared/components/build_article_item.dart';
import 'package:what_is_happening_app/shared/components/custom_divider.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is! GetBusinessLoadingState
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const BuildArticleItem(),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: 50,
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
