import 'package:flutter/material.dart';
import 'package:project_training/core/app_colors.dart';
import 'package:project_training/views/orders_2/orders_2.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Orders2(),
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent)),
    );
  }
}
