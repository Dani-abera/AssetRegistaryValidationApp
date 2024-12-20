import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white, // Clean white background for a crisp look
    primary: Color.fromARGB(255, 56, 125,
        255), // A calm but strong blue for primary actions (buttons, etc.)
    secondary: Color.fromARGB(255, 245, 245,
        245), // Lighter secondary color for less emphasized elements
    tertiary: Colors.grey.shade100, // Light grey for inputs and form fields
    inversePrimary: Colors.black, // Dark text for better contrast
  ),
);
