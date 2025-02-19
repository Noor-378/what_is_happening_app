import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:what_is_happening_app/layout/news_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      
        splash: Column(
          children: [
            Center(
              child: Lottie.asset("assets/animations/News_Animation.json"),
            ),
          ],
        ),
        nextScreen: NewsLayout(),
        backgroundColor: Colors.grey.shade200,
        splashIconSize: 500,
        duration: 3000,
        
        );
  }
}
