import 'package:flutter/material.dart';
import 'package:project_training/core/app_colors.dart';
import 'package:project_training/homePage1.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({super.key, required this.button_text});
  final String button_text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homepage1()),
        );
      },
      child: Text(
        button_text,
        style: TextStyle(color: AppColors.white, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purple, fixedSize: Size(210, 55)),
    );
  }
}
