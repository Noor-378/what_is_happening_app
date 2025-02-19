import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:what_is_happening_app/shared/components/article_builder.dart';
import 'package:what_is_happening_app/shared/components/build_article_item.dart';
import 'package:what_is_happening_app/shared/components/custom_divider.dart';
import 'package:what_is_happening_app/shared/components/loading_animation.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).science;

        return list.length > 0
            ? ArticleBuilder(list: list)
            : LoadingAnimation();
      },
    );
  }
}
