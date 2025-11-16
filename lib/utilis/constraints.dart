import 'package:flutter/material.dart';

// App Constants
class AppConstants {
  static const String appName = 'Grocery App';

  // Color Theme - Teal
  static const Color primaryColor = Color(0xFF009688); // Teal
  static const Color primaryDark = Color(0xFF00796B); // Teal 700
  static const Color primaryLight = Color(0xFF80CBC4); // Teal 200
  static const Color accentColor = Color(0xFF4DB6AC); // Teal 300

  static const Color backgroundColor = Color(0xFFF5F5F5); // Light Grey
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF212121); // Dark Grey
  static const Color textSecondary = Color(0xFF757575); // Grey
  static const Color errorColor = Color(0xFFD32F2F); // Red

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle subHeadingStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textSecondary,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle linkTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: primaryColor,
  );

  // Padding & Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const double borderRadius = 12.0;
  static const double buttonHeight = 50.0;
}
