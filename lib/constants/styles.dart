import 'package:flutter/material.dart';

class AppColors {
  static const Color hintergrund = Color(0xFF231A1A);

  static const Color contrast = Color.fromARGB(255, 148, 124, 124);

  static const Color mittelgrund = Color.fromARGB(255, 17, 13, 13);

  static const Color highattention = Color.fromARGB(255, 81, 182, 148);

  static const Color primaryText = Color.fromARGB(255, 215, 215, 215);

  static const Color lowattention = Color.fromARGB(255, 102, 126, 118);
}

class TextStyles {
  static const TextStyle header = TextStyle(
    color: AppColors.primaryText,
    fontSize: 24,
  );

  static const TextStyle highlighted = TextStyle(
    color: AppColors.highattention,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle normal = TextStyle(
    color: AppColors.primaryText,
    fontSize: 20,
  );

  static const TextStyle small = TextStyle(
    color: AppColors.primaryText,
    fontSize: 15,
  );
  static const TextStyle hintText = TextStyle(
    color: AppColors.lowattention,
    fontSize: 15,
  );
}
