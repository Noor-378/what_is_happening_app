import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Lottie.asset(
                  "assets/animations/news_loading.json",
                  height: 500,
                  width: 500,
                ),
              );
  }
}