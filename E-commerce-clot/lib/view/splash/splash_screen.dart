import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_training/core/shared/navigation_helper.dart';
import 'package:project_training/core/shared/sharedPref.dart';
import 'package:project_training/core/styles/colors.dart';
import 'package:project_training/core/styles/styles.dart';
import 'package:project_training/homePage1.dart';
import 'package:project_training/view/Home/home.dart';
import 'package:project_training/view/onboading/onboading.dart';
import 'package:project_training/view/signin/signin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsManager.primaryColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("assets/Animation - 1732286646228.json",
             delegates: LottieDelegates(),
             onLoaded: (loaded) {
               Future.delayed(loaded.duration ,() {
                final hasSeenOnboarding = CacheHelper.sharedPreferences
                      .getBool('hasSeenOnboarding') ??
                      false;
                  final isLoggedIn = CacheHelper.sharedPreferences
                      .getBool('isLoggedIn') ??
                      false;

                  if (isLoggedIn) {
                    NavigationHelper.goOff(context, Homepage1());
                  } else if (hasSeenOnboarding) {
                    NavigationHelper.goOff(context, SigninScreen());
                  } else {
                    NavigationHelper.goOff(context, OnboardingScreen());
               }
               }
               );
             },
               ),

               Text("CLOT",
               style: TextStyles.clotStyle,

               )
            ],
          ),
        ),
    );
  }
}