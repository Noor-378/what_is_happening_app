import 'package:flutter/material.dart';
import 'package:what_is_happening_app/shared/components/build_article_item.dart';
import 'package:what_is_happening_app/shared/components/custom_divider.dart';

class ArticleBuilder extends StatelessWidget {
  const ArticleBuilder({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          BuildArticleItem(article: list[index]),
      separatorBuilder: (context, index) =>
          const CustomDivider(),
      itemCount: list.length,
    );
  }
}
